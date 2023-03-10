// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

/*实战：做一个多签钱包合约
合约中多个人签名，才能转出币

event:
deposit
submit
approve
revoke
execute

*/
contract MultiSigWallet{
    event Deposit(address indexed sender,uint amount);
    event Submit(uint indexed txID);  //txID是指某笔交易编号？
    event Approve(address indexed owner,uint indexed txID);  
    //合约中有个批准人 就要进行多次批准
    event Revoke(address indexed owner,uint indexed txID);
    event Execute(uint indexed txID);  //都同意后执行

    //一个数组中，保存所有合约的签名人
    address[] public owners;

    //数组里一个个查找很浪费gas，所以要用映射
    //由地址到bool的映射 要判断这个地址是不是owner，只需要在映射中查询一下返回值即可。如果是true就是签名人owner
    mapping(address=>bool) public isOwner;
    //定义一个确认数 不管多少人签名 只需要满足一定人数就可以转账
    uint public required;

    //定义一个交易的结构体struct，保存着每一次对外发出主币的交易数据
    //交易数据包括：一个签名人发起，其他签名人同意
    struct Transaction{
        address to;  //转出的目标地址
        uint value;  //转出的数量
        bytes data; //如果目标地址是一个合约地址，那么还可以执行合约中的一些函数
        bool executed; //是否执行 如果执行了就不能重复执行
    }

    Transaction[] public transactions;  //将所有的执行记录放在一个Transaction类型的数组中

    //定义一个映射：一个交易id号,对应一个签名人地址,对应一个布尔值
    //判断某笔交易下某个签名人是否批准了交易。默认布尔值为false，即默认不批准
    mapping(uint=>mapping(address=>bool)) public approved;

    //构造函数 传入合约的所有签名人地址,也规定最小的确认数
    constructor(address[] memory _owners,uint _required){
        require(_owners.length>0,"owners required"); //要有批准者owner
        require(_required>0 && _required<_owner.length,"invalid required number of owner");
        //最小确认数要大于0而且小于owner数量

        //判断地址数组中的所有地址都是有效地址 即不能为0地址 且不能为重复地址
        for(uint i;i<_owner.length;i++){
            address owner=_owner[i]; //把每个owner赋值给一个变量 可以省gas
            require(owner!=address(0),"invalid owner");
            require(!isOwner[owner],"owner is not unique");  
            //isOwner[owner]是个映射 对应true false。  !isOwner[owner]意思就是为false  不在映射中

            //符合不是0地址和不在映射中的条件，之后才将这个owner地址放到映射中，以及放入签名人的集合中
            isOwner[owner]=true;
            owners.push(owner);
        }

        required=_required;   //将确认数从输入变量 变成状态变量
    }

    //让合约可以接受主币
    receive() external payable{
        emit Deposit(msg.sender, msg.value);
    }

    //提交结构体中的交易数据submit 
    function submit(address _to,uint _value,bytes calldata _data) external onlyOwner returns(bool){
        //data表示什么？如果目标地址是个合约地址 还可以触发一些函数 这些数据的存储方式是calldata
        //onlyOwner 只有合约owner才能发起submit

        //将Transaction结构体放入到transaction数组中
        transactions.push(Transaction({
            to:_to,
            value:_value,
            data:_data,
            executed:false
        }));

        emit Submit(transactions.length-1);  
        //交易id为0，1，2，3，4....即transactions这个数组的元素个数-1

    }

    //再写个onlyOwner的modifier
    modifier onlyOwner{
        require(isOwner[msg.sender],"not owner");  //用isOwner映射判断是不是owner   不用遍历owner数组，可以省gas
        _;
    }



    //approve功能：提交某个交易申请后，只要批准的owner达到最小确认数，就可以执行这笔交易，即返回true
    function approve(uint _txID) 
        external 
        onlyOwner          //只有owner能批准 
        txExists(_txID)    //要求这笔交易的txID是存在的 
        notApproved(_txID)        //要求这个owner之前没有批过这笔交易
        notExecuted(_txID){      //要求这笔交易之前没有批准过


    }

    //补上几个函数修饰器
    //判断txID存在  由于txID就是数组索引 所以只要小于数组长度就存在
    modifier txExists(uint _txID){
        require(_txID<transactions.length,"txID does not exist.");
        _;
    }

    //判断签名人owner之前没有批准过这笔交易
    //用mapping(uint=>mappint(address=>bool)) public approved;判断某笔交易下某个签名人是否批准了交易。默认布尔值为false，即默认不批准
    modifier notApproved(uint _txID){
        require(!approved[_txID][msg.sender],"txID already approved");
        _;
    }

    //判断这笔交易是否被执行过
    //依据  没有
    modifier notExecuted(uint _txID)


    
}