//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;
contract Example{

    // person who deployed the smart contract
    address owner = msg.sender;
    uint importantVar;

    function priviledgeMethod(uint x) external onlyOwner{
        importantVar = x;
    }

    error NOT_OWNER();
    modifier onlyOwner(){
        if(owner != msg.sender){
            revert NOT_OWNER();
        }
        _;
    }


}