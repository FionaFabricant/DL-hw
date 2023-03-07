// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

//来个构造函数
//来个deposit withdraw transfer notPayable 方法


contract Payable{
    //payable address can receive ether
    address payable public owner;

    constructor() payable{  //payable constructor can receiver ether
        owner=payable(msg.sender);
    } 

    function deposit() public payable {}
    function withdraw() public{
        //get the amount of ether stored in this address
        uint amount=address(this).balance;

        (bool success,)=owner.call{value:amount}("");
        require(success,"failed to send ether");
    }

    function transfer(address payable _to, uint _amount) public{
        (bool success,)=_to.call{value:_amount}("");
        require(success,"failed to send ether");
    }

    function notPayable() public{}

    
}