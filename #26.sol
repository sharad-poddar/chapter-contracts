//SPDX-License-identifier: MIT

pragma solidity ^0.8.19;
contract SumOfNumber{

    // automatically initlize to 0
    uint public sum;

    function add() public{
        for(uint i=0;i<200000;i++){
            sum+=i;
        }
    }

}

// here problem is on every iteration state variable is changing which cost gas on every i
// so make local variable and the at final time change the state variable
// also here i=0 is useleess starts frim i=1