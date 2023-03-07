// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract CallTestContract{
    //调用testContract的function

}

contract TestContract{
    uint public x;
    uint public balan=123;

    function setX(uint _x) external {
        x=_x;
    }

    function getX() external view returns(uint){
        return x;
    }

   function setXAndReceiveEther(uint _x) payable external {
        x=_x;
        balan=msg.value;  //将地址的余额赋值给balan
   }

   function getXandBalance() external view returns(uint,uint){
       return(x,balan);  //返回要发送多少ETH 和钱包余额
   }
}

