// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

/*
selfdestruct():
1.删除合约
2.强制发送eth到其他地址
*/

contract Kill{
    //合约中没有主币，用构造函数向合约中传送主币
    constructor() payable {}

    function kill() external {  //external因为是由Helper合约调用的
        selfdestruct(payable(msg.sender)); //参数的地址是销毁合约时发送eth的地址  msg.sender地址要能接受主币的 用payable修饰
    }

    //测试函数 测试合约是否真的销毁成功了 如果销毁成功了 就没有返回值
    function testCall() external pure returns(uint){
        return 123;
    }
}

//创建一个新的合约测试强制发送主币
//正常情况下 合约要能接受主币 需要有fallback或者receive函数 但是selfdestruct方法是强制性的 所以不需要回退函数也可以接受

contract Helper{
    function getBalance() external view returns(uint){
        return address(this).balance;  //返回当前合约的主币余额
    }

    //让测试合约调用Kill合约的kill功能,这样才能让Kill合约把剩余的主币发送给Helper合约
    function kill(Kill _kill) external {  //参数是Kill合约类型 以Kill合约的地址为参数
        _kill.kill();  //调用kill地址中的kill()方法
    }


}