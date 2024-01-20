//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;
contract Owner{

    address public owner;
    constructor(){
        owner = msg.sender;
    }

    ///@notice If you can get the owner to sign a tx on your malicious proxy contract
    ///that calls changeOwner, you can set your own address as owner.
    ///administration functions should almost always have the onlyOwner modifier
    function changeOwner(address _address) public{
        require(tx.origin == owner);
        owner = _address;
    }

}