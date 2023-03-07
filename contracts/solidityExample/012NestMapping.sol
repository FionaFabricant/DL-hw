//嵌套map 加上boolean了

//SPDX-License-Identifier:MIT;
pragma solidity ^0.6.0;

contract NestMapping{
    mapping(address=>mapping(uint=>bool)) public nested; //mapping是个方法啊
    //将地址和另一个mapping方法匹配在一起
    //首先一个uint和一个bool匹配起来，然后一个地址再和这个uint和bool匹配起来 那么这三就匹配在一起了

    //set方法
    function set(address _add,uint _i,bool _boo) public{
        nested[_add][_i]=_boo;
    }

    //get方法
    function get(address _add,uint _i) public view returns(bool){
        return nested[_add][_i];
    }

    //remove方法
    function remove(address _add,uint _i) public{
        delete nested[_add][_i];
    }
}