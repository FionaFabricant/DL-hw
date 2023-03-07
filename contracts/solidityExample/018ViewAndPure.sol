//pure和view的区别 view需要读取链上数据 pure不需要读取

//SPDX-License-Identifier:MIT;
pragma solidity ^0.6.0;

contract ViewAndPure{
    uint public x=1;

    function addToX(uint y)public view returns(uint){
        return x+y;
    }

    function add(uint i,uint j)public pure returns(uint){
        return i+j;
    }
}
