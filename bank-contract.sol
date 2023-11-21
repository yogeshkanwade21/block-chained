// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Bank { 

    // Mappings act as hash tables which consist of key types and corresponding value type pairs
    mapping(address => uint256) private balances;

    function createAccount() public {
        balances[msg.sender] = 0;
    }

    // When a contract is called with a 'payable' function, the caller can send ether along with the function call
    function deposit(uint256 amount) public payable {
        balances[msg.sender] += amount;
    }

    function withdraw(uint256 amount) public {
        // The require keyword is used to ensure that certain conditions are met before proceeding with the execution of a function
        require(balances[msg.sender] >= amount, "Insufficient Balance");
        balances[msg.sender] -= amount;
    }

    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}