//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;
contract Test{

    ///@dev state variable
    ///@dev total storage bytes is 30
    ///@dev it takes 1 storage slot as 32 but it is 30bytes
    struct Transaction{
        address receiver;   // 20bytes
        uint8 id;           // 1bytes
        bool isApproved;    // 1bytes
        uint64 amount;      // 8bytes
    }

}