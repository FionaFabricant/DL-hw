// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract OtherContract{
    uint256 private _x=0;  //状态变量_x

    //收到eth的事件  记录amount和gas
    event Log(uint amount,uint gas);

    //function获取eth余额
    function getBalance() view public returns(uint){
        return address(this).balance;
    }

    //
    function setX(uint256 x) external payable {
        _x=x;
        //如果转入ETH 就出发Log事件
        if(msg.value>0){
            emit Log(msg.value,gasleft());   //gasleft是个啥?
        }
    }

    function getX() external view returns(uint x){
        return _x;
    }
}    

    //上面这个other contract一共有三个function:getBalance,setX和getX
    //下面要在别的合约中调用这个合约的三个function

    //调用其他合约
contract callOtherContract{
    function callSetX(address _Address,uint256 x) external {
        OtherContract(_Address).setX(x);
    }

    function callGetX(OtherContract _Address) external view returns(uint x){
        x=_Address.getX();
    }

    function callGetX2(address _Address) external view returns(uint x){
        x=OtherContract(_Address).getX();
    }

    /*调用合约并发送ETH
    如果目标合约的函数是payable,那么可以通过调用它来给合约转账,格式:
    _contractName(_contractAddress)._functionName{value:_Value}();
    合约名(_合约地址).目标函数名(value:要转的ETH数额(以wei为单位))
    */
    function setXTransferETH(address _Address,uint256 x)payable external{
        OtherContract(_Address).setX{value:msg.value}(x);
        
    }
}