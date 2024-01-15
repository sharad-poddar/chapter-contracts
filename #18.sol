//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;
contract Ownable{

    address owner = msg.sender;

    // virtual allows to ovveride this method
    // in virtual no need to define the conten of function 
    function transferOwner(address _newOwner) public virtual onlyOwner{
        owner = _newOwner;
    }

    error Not_Owner();
    modifier onlyOwner(){
        if(msg.sender != owner){
            revert Not_Owner();
        }
        _;
    }

}

contract Example is Ownable{

    event ownerChange(address oldOwner, address newOwner);

    // we can ovveride this function beacuse it is virtual
    function transferOwner(address newOwner) public override onlyOwner(){
        // new content
        // we also inherits the state variable of parent contract
        address oldOwner = owner;
        // call the function of parent contract with its content
        super.transferOwner(newOwner);
        emit ownerChange(oldOwner, newOwner);
    }


}