// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract wizardEnigma{

    mapping(address => string) public bookOfWinners;
    uint256 private magicNumbers;

    // only can be called from outside
    // it is not neccesary taht tx.origin == msg.sender, as transation can be called by another sc
    // tx.origin and msg.sender are diff
    function enrollWinner(bytes4 magicFunctionSelector, string calldata userName) external{
        require(msg.sender != tx.origin, "Direct Calls are not Worthy");
        // function of this contract calling another function magicFunctionSelector
        (bool success, bytes memory data) = msg.sender.delegatecall(abi.encodeWithSelector(magicFunctionSelector));
        require(success, "Delegate Failed");

        uint256 result;
        assembly{
            result:=mload(add(data, 32))
        }

        require(result == 999,'magic number is not correct');
        bookOfWinners[tx.origin]=userName;
    }

}