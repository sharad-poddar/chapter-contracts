// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract StackClub {
    
    address[] members;

    constructor(){
        members.push(msg.sender);
    }


    function addMember(address _newMember) external onlyMember(){
        members.push(_newMember);
    }

    function isMember(address _address) public view returns(bool){
        for(uint i=0;i<members.length;i++){
            if(members[i] == _address){
                return true;
            }
        }
        return false;
    }

    function removeLastMember() external onlyMember(){
        members.pop();
    }

    modifier onlyMember(){
        require(isMember(msg.sender));
        _;
    }

}