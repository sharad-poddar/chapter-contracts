//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;
///@dev array in solidity -> stores first length then element

contract Test{

    uint256[] public myArray;
    constructor(){
        myArray.push(1);
        myArray.push(2);
        myArray.push(3);
    }

    // total there are 4 slots in array (myArray.length, 1, 2, 3)
    // length of array = myArray.length;
    // Each slot can hold 32 bytes of data
    // 1 byte = 8 bit
    // uint16 -> uint stores in 16 bits or 2 bytes

}