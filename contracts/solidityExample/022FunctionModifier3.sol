//modifier
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract FunctionModifier{
    address public owner;
    uint public x;
    bool public locked;

    //构造函数 初始化地址值
    constructor(){
        owner=msg.sender;  
    }

    //modifier onlyOwner
    modifier onlyOwner(){
        require(owner==msg.sender,"only owner");
        _;
    }

    //modifier validAddress
    modifier validAddress(address _newAddress){
        require(_newAddress!=address(0),"not valid address");
        _; //别忘了函数主体
    }

    function changeOwner(address _newOwner)public onlyOwner validAddress(_newOwner){
        owner=_newOwner;        
    }

    //modifier noReentrancy
    modifier noReentrancy(){
        require(!locked,"noReentrancy");
        locked=true;
        _;
        locked=false;
    }

    function decrement(uint i) public noReentrancy{
        x=x-i;

        if(i>3){
            decrement(i-1);
        }
    }
}