// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

//indexed的作用？用来搜索过滤特定事件的 比如筛选出都是某个地址调用的事件
//indexed在一个事件的参数中最多出现三次
contract Event{
    event Log(string message,uint value);
    event IndexedLog(address indexed sender,uint value);
    event Message(address indexed _from,address indexed _to, string message);

    function EmitEvent() external {
        emit Log("value in the wallet",10);
        emit IndexedLog(msg.sender, 20);
    }

    function EmitMessage(address _to,string calldata _message) external {
        emit Message(msg.sender, _to, _message);
    }

    
}