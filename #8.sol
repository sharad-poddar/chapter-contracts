//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;
///@dev its return is 6 as useing bitwise operator, [and, or, xor]
contract Test{

    uint public x = 10;
    uint public y = 12;

    function test() public view returns(uint){
        return (x & y)^(x | y);
    }

}