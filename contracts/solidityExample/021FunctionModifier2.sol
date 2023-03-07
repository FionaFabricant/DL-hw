//再写一遍functionmodifier
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract FunctionModifier2{
    //合约有地址 数值和是否锁定属性
    address public owner;   //合约的拥有者就是一个地址值
    uint public x=10;
    bool public locked;  //bool的默认值为false

    //构造函数 初始化下地址值
    constructor(){
        owner=msg.sender;  //msg.sender是什么  当前钱包的发起方
    
    }

    //来个修饰器onlyOwner 要求是owner才能进行一些操作
    modifier onlyOwner(){  //所以修饰符onlyOwner也是个函数？？？
        require(msg.sender==owner,"not the owner");
        _;  //onlyOwner只是个修饰符啊 修饰changeOwner的  _;表示函数主体  
    }

    //来个修饰器validAddress 要求是有效地址才能进行一些操作 
    modifier validAddress(address _add){
        require(_add!=address(0),"not a valid address");
        //address(0)是个啥？ 表示不是初始地址值，即owner的地址值？？
        _;
        //_;在require()的下面 表示validAddress做修饰符时 先执行require()部分 再执行函数主体
    }

    //来个更换owner函数 被两个修饰符修饰
    function changeOwner(address _newAddress) public onlyOwner validAddress(_newAddress){  
        //valiAddress(_newAddress)带参数的别忘记了
        owner=_newAddress;
    }

    //来个不能重入的修饰符
    modifier noReentrancy(){
        require(!locked,"no Reentrancy"); //首先要求是unlocked状态 否则就报错

        locked=true;
        _;          //将locked设置为true状态 然后执行函数主体 之后再将locked设置为false状态
        locked=false;
    }

    function decrement(uint i)public noReentrancy{
        x-=i;                //x=10 x=x-i 

        if(i>1){        //如果i>1 就i-1 继续
            decrement(i-1);
        }
    }
}