//SPDX-License-Identifier:MIT
pragma solidity ^0.6.0;

//映射mapping
contract Mapping{
    mapping(address=>uint) public myMap;  //mapping的作用是将一个address和一个uint匹配起来
    //定义了一个map方法 将一个地址和一个数字匹配起来
    //比如 0x1aE0EA34a72D944a8C7603FfB3eC30a6669E454C，1  就将地址和数字匹配起来了

    function getbyAdd(address _add) public view returns (uint){
         return myMap[_add];  //添加一个地址 返回_add这个地址对应的数字 如果这个地址没有对应的uint 那默认值就是0
    }

    //设置地址对应的数值
    function set(address _add,uint _i) public{
        myMap[_add]=_i;  //设置一下，myMap的_add地址对应的数值是_i;
    }

    //将地址值删除，就是说恢复到0
    function deleteNum(address _add) public{
        delete myMap[_add];
    }
}