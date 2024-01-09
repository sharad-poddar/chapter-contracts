//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;
contract Owner{

    address public owner;
    uint private code;

    ///@dev here anyone with code can change the owner
    constructor(address _owner, uint _code){
        owner = _owner;
        code = _code;
    }

    function getOwner() public view returns(address){
        return owner;
    }

    function changeOwner(address _newOwnerAddress, uint _code) public{
        require(code == _code, 'please enter the correct code to change owner');
        owner = _newOwnerAddress;
    }

}