// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

//mapping映射    mapping(address =>uint )可以理解成从mapping(address)找到一个uint？
contract Mapping{
    uint AddressBalance1;
    uint AddressBalance2;

    mapping(address =>uint ) public balance; //所以mapping算是一种数据类型？类似string uint
    mapping(address=>mapping(address=>bool)) public isFriend; //nested mapping

    function mappingExample() external {
        //set mapping
        balance[msg.sender]=123;

        //get mapping
        AddressBalance1=balance[msg.sender];   //例如一个钱包和余额
        AddressBalance2=balance[address(1)]; //address(1)是个啥 

        //update mapping
        balance[msg.sender]+=456; //变成123+456即579

        //delete mapping
        delete balance[msg.sender]; //变成uint的default值0

        isFriend[msg.sender][address(this)]=true;
    }
}