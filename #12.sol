//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;
contract Test{

    address public owner;
    
    ///@dev paying in the time of deploying
    constructor() payable{
        owner = msg.sender;
    }

    ///@dev amount should be in ether
    function sendEther(address _receipt) public{
        require(address(this).balance >= 1, 'insufficient balance');
        require(msg.sender == owner, 'only owner can call this');
        uint amount = 1 ether;
        payable(_receipt).transfer(amount);
    }

}