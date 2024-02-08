//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Test{

    // struct can be space-optimized using slots allocation
    // 1 slot can contain 32 bytes
    struct UserData{
        address user;       // 20 bytes -> 160 bits, 40 character long string/Hash // slot --2
        uint256 id;         // 256 bits -> 32 bytes  // single slot -- 1
        uint40 timestamp;   // 40 bits -> 5 bytes    // single slot  -- slot2
        string message;     // 1 bytes -> 8 bits     // slot --2
        uint8 royalty;      // 1 bytes -> 8 bits     // slot --3
    }

    struct UserData_1{
        uint256 id;         // slot-->1
        address user;       // slot-->2
        uint40 timestamp;   // slot-->2
        uint8 royalty;      // slot-->2
        string message;     // slot-->3
    }

}