//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

///@notice there is no way to send ethers as no fallback(), receive and payable modifier;
///we can send ether with selfdestruct of another contract as it send directly to receiver address

contract Test{

    function getBalance() public view returns(uint){
        return address(this).balance;
    }

}