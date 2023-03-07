
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract SimpleStorage{
    uint favoriteNumber; //不是public的噢 看不到的

    //将一个数据存储在链上 然后再读取出来
    function store(uint _num) public {
        favoriteNumber=_num;
    }

    function retrive() public view returns(uint){
        return favoriteNumber;
    }

    //搞个People的结构体
    struct People{
        uint age;
        string name;
    }

    //创建一个People数组 名字叫做people
    People[] public people;  

    //创建一个添加people功能  //用push方法添加
    function addPeople(uint _age,string memory _name) public{  
        //为什么_name要加memory  _age不用？？
        people.push(People(_age,_name));
    }
}