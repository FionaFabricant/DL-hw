// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;


contract X{
    string public name;
    //constructor
    constructor(string memory _name){
        name=_name;
    }
}

contract Y{
    string public text;
    constructor(string memory _text){
        text=_text;
    }
}

//inheritance
contract B is X("xxx"),Y("yyy"){

}

contract C is X,Y{
    constructor(string memory _name,string memory _text) X(_name) Y(_text){  //这里的X Y作为修饰符存在吧

    }

}

contract D is X,Y{
    constructor() X("X was called") Y("Y was called"){
        
    }
}