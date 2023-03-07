/*
哈希算法特点:
1.输入相同的,输出一定相同
2.哈希算法不可逆向运算 常用于签名

一个好的哈希函数应该具有以下几个特性：

单向性：从输入的消息到它的哈希的正向运算简单且唯一确定，而反过来非常难，只能靠暴力枚举。
灵敏性：输入的消息改变一点对它的哈希改变很大。
高效性：从输入的消息到哈希的运算高效。
均一性：每个哈希值被取到的概率应该基本相等。

Hash的应用
生成数据唯一标识
加密签名
安全加密

Keccak256函数是solidity中最常用的哈希函数，用法非常简单：
哈希 = keccak256(数据);

生成数据唯一标识:
function hash(uint _num,string memory _string,address _addr) public pure returns(bytes32){
    return keccak256(abi.encodePacked(_num,_string,_addr));
} 
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract HashFunc{
    function hash(string memory text,uint num,address addr) external pure returns(bytes32){
        return keccak256(abi.encodePacked(text,num,addr));
    }

    function encode(string memory text1,string memory text2) external pure returns(bytes memory){
        return abi.encode(text1,text2);
    }

    function encodePacked(string memory text1,string memory text2) external pure returns(bytes memory ){
        return abi.encodePacked(text1,text2);
        //bytes表示不定长度的返回值,不定长度的返回值就要用到memory
    } 

    //encodePacked 可能会导致哈希碰撞 不同输入产生同样的输出 
    function collision(string memory text0,uint x,string memory text1) external  pure returns(bytes32){
        return keccak256(abi.encodePacked(text0,x,text1));
    }
    //解决方法一:不用encodePacked 用encode
    //解决方法二:在两个参数text0和text1之间加入一个uint

}

