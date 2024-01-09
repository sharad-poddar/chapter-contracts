//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;
contract A{
    function test() virtual public pure returns(uint){
        return 123;
    }
}    

contract B{
    function test() virtual public pure returns(uint){
        return 456;
    }
}

///@dev c.test() returns 123
///@dev Since super.test() is called without specifying a particular parent, 
///it will invoke the function from the leftmost parent (in this case, Contract A).
contract C is A, B{
    function test() public pure override(A,B) returns(uint){
        return super.test();
    }
}

contract D is A, B{
///@dev for specific parent call
    function test() public pure override(A, B) returns(uint) {
        return A.test();
        // return B.test();
    }
}