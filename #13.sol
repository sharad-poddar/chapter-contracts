//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;
///@dev random number with the help of block.timestamp and block.number of the transaction
///@dev it is less secure method
contract Lottery{

    address public owner;
    uint public id;
    mapping(uint => address) public participantsById;
    uint public winnerId;
    address public winner;

    function register() public payable{
        require(msg.value == 1 ether, 'send sufficient amount');
        participantsById[id] = msg.sender;
        id++;
    }

    function chooseNumber() public {
        require(msg.sender == owner, 'only owner can call this');
        // means 10 participants are there
        require(id == 10, 'first filling of all slots');
        winnerId = uint(keccak256(abi.encodePacked(block.timestamp, block.number))) % 11;
        winner = participantsById[winnerId];
        payable(winner).transfer(address(this).balance);
    }

}