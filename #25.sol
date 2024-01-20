//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;
contract Savings{


    // in solidity when the value gets overflow it reduce to the much lower value or 0
    // so when we have to get the fund back in less time then cutoff, then call extendCutoff  
    // with larger value to overflow cutoff
    // its only valid in solidity version < 0.8.0
    
    uint public cutoff;
    function deposit() public payable{
        cutoff = block.timestamp + 10 days;
    }

    function extendCutoff(uint _time) public{
        cutoff+=_time;
    }

    function withdraw() public{
        require(block.timestamp >= cutoff);
        payable(msg.sender).transfer(address(this).balance);
    }

}