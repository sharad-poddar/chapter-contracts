//SPDX-License-Identifier: MIT

contract Example{
    uint[3] favouriteNumber;

    constructor(){
        // avoid these, it costs more gas
        this.modifyArray(favouriteNumber);
    }

    function modifyArray(uint[3] calldata arr) external pure{
        // here we get array as a call message, read only
    }
}

// memory array does't exist the push function
// push function only exerted by stoarge array