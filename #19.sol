//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

// what happening behind the scene in mapping
// in assembly we have to change the slot again and again but in mapping it dones automatically
contract Map{

    mapping(address => bool) isMember;   // base slot 0x0

    function join() external{

        // how things work at the back;
        // SSTORE(keaack256(msg.sender + 0x0), true);
        // in encode we can send uint, bool etc
        // in encodePacked we can send only string
        bytes32 slot = keccak256(abi.encode(msg.sender, 0x0));
        assembly{
            sstore(slot, true)
        }
        // isMember[msg.sender] = true;
    }

    function belongs(address _address) external view returns(bool){
        // SSLOAD(keaack256(msg.sender + 0x0))
        //return isMember[_address];

        bytes32 slot = keccak256(abi.encode(_address, 0x0));
        bool value;
        assembly{
            value := sload(slot)
        }
        return value;
    }

}


// mapping with structs
contract X{

    struct Proposal{
        bytes data;
        address target;
        mapping(address => bool) votes;
    }

    Proposal[] proposals;

    // correct way of mapping
    function createProposal(bytes memory _data, address _target) external{
        Proposal storage newProposal = proposals.push();
        newProposal.data = _data;
        newProposal.target = _target;
        newProposal.votes[msg.sender] = true;

        // mapping cannot be contructed in instance by using memory
        // use storage and initlize it then assign value
    }

}