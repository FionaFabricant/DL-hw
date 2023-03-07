//Variable再写一遍 global / state / local variables
//SPDX-License-Identifier:MIT;
pragma solidity ^0.6.0;

contract Variables2{
    uint8 public num=type(uint8).max;  //state variable 消耗gas的 写在区块链上的
    int16 public num1=type(int16).min; //state variable
    string public text="hello"; //state variable

    function DoSomething() public view returns(uint,address){
        uint num=456; //local variable 局部变量 调用函数的时候才会出现 不消耗gas

        uint timestamp=block.timestamp; //当前区块的时间戳 global variables 无论在不在函数内都能调用
        address sender=msg.sender; //当前调用方法的地址 global variables 

        return (timestamp,sender);   //怎么一个return 一个returns呢
    }

}