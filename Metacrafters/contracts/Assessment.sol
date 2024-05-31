// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Assessment {
    address payable public owner;
    uint256 public balance;

    event Deposit(address indexed account, uint256 amount);
    event Withdraw(address indexed account, uint256 amount);
    event Transfer(address indexed from, address indexed to, uint256 amount);

    constructor(uint256 initBalance) payable {
        owner = payable(msg.sender);
        balance = initBalance;
    }

    function getBalance() public view returns (uint256) {
        return balance;
    }

    function deposit(uint256 _amount) public payable {
        require(msg.sender == owner, "You are not the owner of this account");
        balance += _amount;
        emit Deposit(msg.sender, _amount);
    }

    error InsufficientBalance(uint256 balance, uint256 withdrawAmount);

    function withdraw(uint256 _withdrawAmount) public {
        require(msg.sender == owner, "You are not the owner of this account");
        if (balance < _withdrawAmount) {
            revert InsufficientBalance(balance, _withdrawAmount);
        }
        balance -= _withdrawAmount;
        emit Withdraw(msg.sender, _withdrawAmount);
    }

    function transfer(address _to, uint256 _amount) public {
        require(_to != address(0), "Invalid recipient");
        require(_to != owner, "You can't transfer to the owner");
        require(balance >= _amount, "Insufficient balance");
        
        balance -= _amount;
        emit Transfer(msg.sender, _to, _amount);
    }

    function changeOwner(address payable _newOwner) public {
        require(msg.sender == owner, "You are not the owner of this account");
        owner = _newOwner;
    }
}
