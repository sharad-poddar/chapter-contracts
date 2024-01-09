//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;
///@dev both functions are same tasking but bar takes less gas as i++ takes more steps then ++i
///i++ -> i=i, i=i+1;  more steps
///++i -> i=i+1;   less steps
contract Sum{

    function foo(uint[] memory data) public pure returns(uint){
        uint sum=0;
        for(uint i=0; i<data.length; i++){
            sum+=data[i];
        }
        return sum;
    }

    function bar(uint[] memory data) public pure returns(uint){
        uint sum=0;
        for(uint i=0; i<data.length; ++i){
            sum+=data[i];
        }
        return sum;
    }
}