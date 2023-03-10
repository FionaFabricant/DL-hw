// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
/*
存钱罐练习：
所有人都可以存币进钱包，
只有钱包的所有者才可以取出币
取出币之后钱包就被销毁
*/
contract PiggyBank{
    //定义合约所有者
    address public owner=msg.sender;  
    //将msg.sender赋值为owner  这样的赋值结果和构造函数赋值的结果一样

    //定义个收款事件：收到款之后，向链上汇报,参数即为收到的数量
    event Deposit(uint amount); 

    //同样的 定义个取款事件 取款之后向链上汇报 参数为取出的数量
    event Withdraw(uint amount);
    
    //创建收款方法
    receive() external payable {
        emit Deposit(msg.value);    //收到款之后向链上汇报  所以event只是个记录？
    }

    //创建取款方法，取款后销毁
    function withdraw() external{
        require(msg.sender==owner,"not the owner"); //要求合约所有者才可以取款
        //将合约上存储的主币发送给合约拥有者，然后销毁
        //调用合约的自毁方法 就可以完成两个动作
        emit Withdraw(address(this).balance);  //取出的数量就是当前地址的所有余额
        selfdestruct(payable(msg.sender));
    }
}