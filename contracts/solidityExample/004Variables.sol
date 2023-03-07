//Variables

//SPDX-License-Identifier:MIT;
pragma solidity ^0.6.0;

contract Variable{
    string public text="hello";  //state variable

    //type函数 通过内置的type函数获取当前类型变量的最大值和最小值
    uint16 public num=type(uint16).max; //uint16的最大值  //state variable
    int8 public num2=type(int8).min; //uint8的最小值  //state variable

    /*
    global variable：全局变量：关于区块链的一些信息 无论这个变量在函数内函数外都能调用;
                    比如当前区块的时间戳,
                    比如address sender=msg.sender表示当前调用这个函数的地址值，
    local variable：局部变量：定义在函数内部的变量 不是存储在链上的 不需要消耗gas 只有调用函数的时候才会出现
    state variable：提供关于blockchain的信息 存储在链上的 要消耗gas的 比如将hello写进链上 占用了空间 所以要消耗gas
    */

    function doSomething() public view returns(uint,address){  //view只查看 returns(uint):返回uint和address类型
        uint num1=99;  //local variable 存储在函数中的 不消耗gas 调用函数的时候才会出现

        uint time=block.timestamp;  //当前区块的时间戳   //global variable
        //时间戳是什么：1970年到现在时间的秒数
    
        address sender=msg.sender;  //当前调用这个函数的地址  //global variable

        return (time,sender);
    }
}

