// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

/*
emit的作用 触发一个事件：
声明一个事件
event Deposit(address indexed _from, bytes32 indexed _id, uint _value);

触发事件
emit Deposit(msg.sender, _id, msg.value);
*/

//创建一个合约并发出一个事件
/*
contract Event{
    uint public count=0;
    event Increment(address who);

    function increment() public{
        emit Increment(msg.sender);
        count+=1;
    }
}
*/

contract Event{
    event Log(address indexed sender,string message);
    event AnotherLog();

    function test() public{
        emit Log(msg.sender,"hello world!");
        emit Log(msg.sender,"hello EVM!");
        emit AnotherLog();
    }
}
