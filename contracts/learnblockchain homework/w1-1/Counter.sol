// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Counter{
    uint public num=100;

    function add(uint x) external view returns(uint result){
        result = num+x;
    }
}