//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;
///@dev here while calling both function the value of num_1 and num_2 remains same 1 and 1
///as require statment revert back and make the states default or predefined
contract Number{

    uint public num_1 = 1;
    uint public num_2 = 1;

    function changeNum_1(uint _num) public{
        require(_num > 10, 'revert back');
        num_1=_num;
    }

    function changeNum_2(uint _num) public{
        num_2=_num;
        require(_num > 10, 'revert back');
    }

}