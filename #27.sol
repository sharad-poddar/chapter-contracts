//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

// it was compiled with 200 runs optimisation
// so its bytecode size is less
contract sum1{

    uint a = 1000;
    uint b = 2000;
    uint sum;

    function add() public{
        sum = a+b;
    }
}

// it was compiled with 1000 runs optimisation
// so its bytecode size is more
contract sum2{

    uint a = 1000;
    uint b = 2000;
    uint sum;

    function add() public{
        sum = a+b;
    }
}

// on time of deploying contract sum1 cost less gase then sum2