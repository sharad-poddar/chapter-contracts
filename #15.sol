//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

//calling from another contract constructor made possible to bypass isContract
contract ClubMemner{

    uint public id;
    mapping(uint => address) public members;

    ///@notice gives us wheather the address is contract or not
    function isContract(address _address) public view returns(bool){
        uint size;

        // it returns the size of bytecode of that address 
        // if size is greater then 0 then it is contract
        // := used as assignment operator
        assembly{
            size:= extcodesize(_address)
        }
        return size > 0; 
    }

    ///@notice if address is not contract then made it as an member
    ///@dev somethime one contract call another in that case msg.sender is contract's
    function register() public{
        require(!isContract(msg.sender),"contracts are not allowed to register");
        members[id] = msg.sender;
        id++;
    }

}