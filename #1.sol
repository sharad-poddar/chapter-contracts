//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;
contract Bank{

    mapping(address => uint) public balance;

    function deposit() public payable{
        balance[msg.sender]+=msg.value;
    } 

    ///@dev reteerency attack can occour when order of changing and sending balance is 
    ///not correct. first balance will change then transfer amount
    function withdraw(uint _amount) public{
        require(balance[msg.sender] >= _amount, 'Insufficient Balance');
        balance[msg.sender]-=_amount;
        payable(msg.sender).transfer(_amount);
    }

}