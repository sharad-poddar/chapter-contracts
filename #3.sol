//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;
///@dev payable is a modifier used to receive or send ether to/from smart contract
///@dev payable const less gas as from simple function. 
///@dev here view cost less gas as it is read only function.

contract Test{

    uint256 public a = 10;
    uint256 public b = 20;

    function foo() external view returns(uint256){
        return a+b;
    }

    function bar() external payable returns(uint256){
        return a+b;
    }

}