/*
做个eth钱包：
钱包里有构造函数，有owner，有receive Eth方法，有withdraw Eth方法，有get Balance方法
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Wallet{
    //owner
    address payable public owner;  //owner need to be payable so can receive or withraw eth

    //构造函数
    constructor() {
        owner=payable(msg.sender);  //what is the usage of constructor 
        //declare the owner as msg.sender
    }

    //receiveEth
    receive() payable external {}  
    //use receive()/fallback() to receive ETH 
    //receive() need to be external so can be called
    
    //withdraw
    function withdrawEth(uint _amount) external {
        require(msg.sender==owner,"not the owner");
        //only the owner can withdraw eth

        payable(msg.sender).transfer(_amount);  
        //use transfer()/can()/send() to withdraw Eth
    }
}