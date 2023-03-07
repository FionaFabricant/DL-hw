//SPDX-License-Identifier:MIT;
pragma solidity ^0.6.0;

contract Event{
    event log(address indexed sender,string message);
    event AnotherLog();

    function test() public{
        emit log(msg.sender,'Hello Word');
        emit log(msg.sender,"hi Evm");
        emit AnotherLog();
    }
}