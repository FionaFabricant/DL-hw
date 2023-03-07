// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract dataStorage{

    struct MyStruct{
        uint num;
        string text;
    }

    mapping(address=>MyStruct) public myStructsMapping; //映射myStruct和结构体MyStruct的区别？？

    function examples() external {
        myStructsMapping[msg.sender]=MyStruct({num:123,text:"balance"});

        MyStruct storage mystr1=MyStruct[msg.sender];
        MyStruct.text="foo";

        MyStruct memory read
    }

}