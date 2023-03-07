//read and write:用到get()和set() function

//SPDX-License-Identifier:MIT;
pragma solidity ^0.6.0;

contract SimpleStorage{
    uint public num;

    function set(uint _num) public{  //set方法的作用：将_num赋值给num  //这个方法要消耗gas的
        num=_num;
    }

    function get() public view returns(uint){    //view只读 returns一个uint
        //get方法作用 获取值  //这个get()方法只是读取 所以不消耗gas 方法还能不消耗gas...666
        return num;
    }
}