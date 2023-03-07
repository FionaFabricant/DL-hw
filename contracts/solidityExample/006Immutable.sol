/*immutable 不可篡改:
变量前加了immutable修饰符 说明他只能被constructor这个初始化函数修改，之后就再也不能修改了
什么时候用到？用来初始化地址值吧 固定地址值
*/
//SPDX-License-Identifier:MIT;
pragma solidity ^0.6.0;

contract Immutable{
    address public immutable MY_ADDRESS;
    uint public immutable MY_UNIT;

    constructor(uint _myUint){  //constructor构造函数？是指合约部署时跟着初始化的一个函数
        MY_ADDRESS=msg.sender;  //这里的MY_ADDRESS和MY_UINT不能修改了
        My_UINT=My_Uint;
    }

}
