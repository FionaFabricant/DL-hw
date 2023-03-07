//数组
//SPDX-License-Identifier:MIT;
pragma solidity ^0.6.0;

contract Array{
    uint[] public arr1;  //未知长度的数组
    uint[] public arr2=[3,6,9,12,15,18,21];   
    uint[10] public arr3;  //固定长度数组 每个元素的默认值都是0

    //array的属性
    //返回某个值
    function get(uint _index) public view returns(uint){
        return arr2[_index];
    } 

    //返回整个数组
    function getArray() public view returns(uint[10] memory){  //记得加个memory啊
        return arr3;
    }
    function getArray2() public view returns(uint[] memory){
        return arr2;
    }

    //加入一个元素 用push
    function addElement(uint _i)public{
        arr2.push(_i);
    }

    //去掉最后一个元素 pop
    function pop() public{
        arr2.pop();
    }

    //求数组长度 .length
    function getLength() public view returns(uint){
        return arr2.length;
    }

    //在内存中创建一个数组 只能创建固定长度的数组
    function examples() external{  //external函数：只能被外部函数调用 不能被当前函数调用
        uint[] memory a=new uint[](5); //这可不是创建数组对象吗 //创建一个长度为5的uint数组？？yes
    }
}