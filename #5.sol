//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;
///@dev each slot in solidity can hold 32 bytes of data
///@dev assumned to slot starts from 0
///@dev here password is stores in slot3
contract findSlot{

    uint16 public tokenId;          // 2 bytes -> slot0
    address public admin;           // 20 bytes -> slot0
    uint128 public saleStart;       // 16 bytes -> slot1
    bool public saleStarted;        // 1 bytes -> slot1
    uint16 public totalSupply;      // 2 bytes -> slot1
    address[2] public buyers;       // 40 bytes -> slot2
    bytes32 private password;       // 32 bytes -> slot3
    bool public isPaused;           // 1 bytes -> slot4

}

