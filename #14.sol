//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;
contract inhertWealth{ 

    bytes32 constant public passwordHash = 0xfe6bf1c182dbcd676f4b69554bedf29d50ba164778e9a076734ebce3d2cca8f8;

    function inherit(string memory password) public {
        require(passwordHash == keccak256(abi.encodePacked(password)), 'password invalid');
        payable(msg.sender).transfer(address(this).balance);
    }

}