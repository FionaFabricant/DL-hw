/*
什么合约叫做ERC20标准合约？
只要你的合约对外包含IERC20的所有接口，就满足了erc20标准

IERC20接口合约中的接口包含：
totalSupply()  当前合约的总供给
balanceOf       某账户当前余额
transfer         将当前账户中的余额发送到另一个地址  是写入方法 还要有个transfer event对外汇报
allowance       设置转账额度
approve        批准转账
transferFrom   向另一个合约转账时，对方合约要调用transferFrom方法才能把我方账户中的余额拿到它账户中

*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

//先写个IERC20的接口
interface IERC20{
    function totalSupply() external view returns(uint); //接口不用写函数主体

    function balanceOf(address account) external view returns(uint);

    function transfer(address recipient,uint amount) external returns(bool);
    //transfer是写入方法 还有个transfer event

    function allowance(address owner,address spender) external view returns(uint);

    function approve(address spender,uint amount) external returns(bool);
    //approve也需要apprval event

    function transferFrom(address spender,address recipient,uint amount) external returns(bool);

    event Transfer(address indexed from,address indexed to,uint amount);

    event Approval(address indexed owner,address indexed spender,uint amount);
}

contract ERC20 is IERC20{   //让ERC20继承IERC20 则ERC20会override IERC20中的所有方法
    uint public totalSupply;  //当前合约的token总量

    //ERC20一般通过构造函数把指定数量的token余额赋值给当前合约的部署者
    
    //定义一个映射：一个地址对应一个数字，就可以形成一个账本
    mapping(address=>uint) public balanceOf;    //balanceOf是erc20的核心账本   //这个映射是个账本啊
    //定义一个批准型的映射，一个发送者的地址对应一个被批准的地址，再对应一个数量
    mapping(address=>mapping(address=>uint)) public allowance;

    //定义erc20这个token的名称,符号,精度
    string public name="Test";
    string public symbol="TEST";
    uint8 public decimals=18;  //token的精度常用的是18位的精度：1加18个0

    //override IERC20的function
    //transfer：发送者账户中减少amount，接收者账户中增加amount
    function transfer(address recipient,uint amount) external returns(bool){
        balanceOf[msg.sender]-=amount;
        balanceOf[recipient]+=amount;
        emit Transfer(msg.sender, recipient, amount);  
        return true;
    }    

    //批准方法：
    function approve(address spender,uint amount) external returns(bool){
        allowance[msg.sender][spender]=amount;   //msg.sender给被授权账户设置一个允许转账的限额
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(address spender,address recipient,uint amount) external returns(bool){
        //在函数transferFrom中，参数一个是发送者，一个是接收者。
        //函数的调用者是批准额度中的被批准的账户，而发送者就是批准额度中的调用者，
        allowance[spender][msg.sender]-=amount; //发送者减少允许转账的额度？
        balanceOf[spender]-=amount;     //减少发送者的余额
        balanceOf[recipient]+=amount;
        emit Transfer(spender, recipient, amount);
        return true;
    }

    //铸币方法mint
    function mint(uint amount) external{  //这里省略了权限控制功能
        balanceOf[msg.sender]+=amount;   //合约调用者增加token数量
        totalSupply+=amount;     //token总供应量增加
        emit Transfer(address(0), msg.sender, amount);    //由0地址发送到合约调用者。0地址发出token，意思就是铸币
    }

    //销毁方法burn
    function burn(uint amount) external {   //这里也省略了权限控制
        balanceOf[msg.sender]-=amount;   //销毁是由当前合约的调用者来销毁，当前合约调用者的token减少
        totalSupply-=amount;     //token总供应量减少
        emit Transfer(msg.sender,address(0),amount);   //token由当前合约的调用者转到了0地址，转到0地址，意思就是销毁
    }
}