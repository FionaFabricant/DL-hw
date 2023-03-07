//SPDX-License-Identifier:MIT;
pragma solidity ^0.6.0;

contract Mapping{
    mapping(address=>uint) public myMap;

    //set方法 设置地址和值的键值对
    function set(address _add,uint _i) public{
        myMap[_add]=_i; //将myMap的地址_add和数值_i匹配起来； 比如0x4B0897b0513fdC7C541B6d9D7E929C4e5364D2dB,12
    }

    //get方法 通过输入地址 获取到值
    function get(address _add) public view returns(uint){
        return myMap[_add]; //返回myMap的_add地址对应的数值
    }

    //delete方法  删除地址值对应的数值 也就是对应的数值为0
    function deleteNum(address _add) public{
        delete myMap[_add];
    }
}