//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;
///@dev pure is own function, not read and write
///@dev mul takes more gas then left shift
contract Test{

    // more gas
    function double(uint8 x) public pure returns(uint8){
        return x*2;
    }

    // less gas
    function shiftLeft(uint8 x) public pure returns(uint8){
        return x<<1;
    }

}