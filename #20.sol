//SPDX-License-Identifier: MIT

// external -> can only be called by external contracts
// internal -> can be accessd throuch inherited contract
// private -> within the contract
// public -> open all



pragma solidity ^0.8.19;
contract Test{
    uint[3] favouriteNumbers;

    constructor(){
        modifyArray(favouriteNumbers);
        // here favouriteNumbers[0] becomes 22;
    }

    // we can only change the orginial array withing contract so private
    function modifyArray(uint[3] storage nums) private{
        nums[0] = 22;
    }
}


contract X{
    function readArr(uint[] calldata arr) external view{
        // here we gets the copied array
        // this function directly accessible to users or other contracts
        // calldata takes less gas as it is only read not write
        // memory needs more gas as it read and write both
    }

}


contract Y{
    function readArr(uint[] memory arr) external pure{
        arr[5]=22;
    }
}


// inbuilt function for arr
// push(), pop() and length
