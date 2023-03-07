//SPDX-License-Identifier:MIT;
pragma solidity ^0.6.0;

//inheritance 
//合约B继承合约A用is，contract B is A
//父类会被子类改写的function用virtual修饰
//子类里要改写父类功能的function用override修饰

/*
         A
       /   \
      B     C
    /   \  / 
   F     D,E
*/

// Contracts can inherit from multiple parent contracts.
// When a function is called that is defined multiple times in
// different contracts, parent contracts are searched from
// right to left, and in depth-first manner.

contract A{
    function foo() public pure virtual returns(string memory){   
        //父类function用virtual修饰
        return "A";
    }
}

//B继承了A
contract B is A{  //用is表示继承
    function foo() public pure virtual override returns(string memory){  
        //用virtual表示后面B的foo()还会被子类继承，用override表示B的foo()继承自A
        return "B";
    }
}

//C继承了A
contract C is A{
    function foo() public pure virtual override returns(string memory){
        return "C";
    }
}

//D继承了B,C
contract D is B,C{   //D继承了B,C 那么在override(B,C)这里也要加上B,C，表示顺序？？？
    function foo() public pure override(B,C) returns(string memory){
        return super.foo();  //返回父类的foo()function， 返回的是(B,C)最右的父类，也就是C
    }
}

//E继承了C,B  //所以继承B,C和继承C,B还不一样  返回的是最右的
contract E is C,B{
    function foo() public pure override(C,B) returns(string memory){
        return super.foo();  //返回的是(C,B)最右边的B
    }
}

/*
//F继承了A,B
contract F is A,B{
    function foo() public pure override(A,B) returns(string memory){
        return super.foo(); //返回的是B 
    }
}
*/
