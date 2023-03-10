/*
再写一遍ERC20

1.先写IERC20接口
IERC20有6个方法
totalSupply()
balanceOf
transfer
allowance
approve
transferFrom
transfer和approve要写对应的event

2.再在ERC20合约中把IERC20的接口都使用一遍
totalSupply定义成常量
balanceOf和allowance定义成映射
再写剩下三个function：transfer  approve transferFrom

ERC20额外添加的：
定义代币的名称 符号和精度
增加铸币方法
增加销毁方法
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
interface IERC20 {
    //6个function
    function totalSupply() external view returns(uint);
    function balanceOf(address account) external view returns(uint);
    function transfer(address recipient,uint amount) external returns(bool);
    function allowance(address owner,address spender) external view returns(uint);
    function approve(address spender,uint amount) external returns(bool);
    function transferFrom(address sender,address recipient,uint amount) external returns(bool);

    //两个event
    event Transfer(address indexed  from,address indexed to,uint amount);
    event Approval(address indexed  owner,address indexed spender, uint amount);
}

contract ERC20 is IERC20{  //继承IERC20接口

    //给代币名称,符号和精度  //改用构造函数也可以
    string public name="test";
    string public symbol="TEST";
    uint public decimal=18;

    uint public totalSupply;
    mapping(address=>uint) public balanceOf;  //每个地址对应每个值，就可以组成一个账本
    mapping(address=>mapping(address=>uint)) public allowance;   //一个授权的地址，对应一个被批准地址，再对应一个批准转账的金额

    //transfer原理 转出方余额减少 接收方余额增加
    function transfer(address recipient,uint amount) external returns(bool){
        balanceOf[msg.sender]-=amount;
        balanceOf[recipient]+=amount;
        emit Transfer(msg.sender,recipient,amount);
        return true;
    }

    //approve原理 一个授权地址，允许被批准地址转账，转账金额等于amount
    function approve(address spender,uint amount) external returns(bool){
        allowance[msg.sender][spender]=amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    //transferFrom原理 转出者余额减少 接收者余额增加 ,而且allowance中允许转账的额度减少,而且触发转账事件
    function transferFrom(address sender,address recipient,uint amount) external returns(bool){
        balanceOf[sender]-=amount;
        balanceOf[recipient]+=amount;
        allowance[sender][msg.sender]-=amount;
        emit Transfer(msg.sender,recipient,amount);
        return true;
    }

    //铸币  铸币原理；总供应量增加 合约调用者的余额增加,触发transfer event(从0地址向合约调用者转账)
    function mint(uint amount) external{   //省略了权限控制
        totalSupply+=amount;
        balanceOf[msg.sender]+=amount;
        emit Transfer(address(0), msg.sender, amount);
    }

    //销毁 销毁原理：总供应量减少 合约调用者的余额减少 触发transfer event，从合约调用者的地址向0地址转账
    function burn(uint amount) external{  //省略了权限控制
        totalSupply-=amount;
        balanceOf[msg.sender]-=amount;
        emit Transfer(msg.sender, address(0), amount);
    }
}