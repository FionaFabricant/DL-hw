// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

//struct用于多种不同数据类型  例如string address uint放在一起
//enum用于同种数据类型的 例如都是Status类型

contract Enum{

    //Order struct有owner和status数据  status数据里又有不同状态
    struct Order{
        address owner;
        string status;
    }

    //Order放在一起做个数组
    Order[] public orders;

    //有不同status
    enum Status{
        None,
        Pending,
        Shipped,
        Completed,
        Rejected,
        Canceled
    }

    //将status实例化
    Status public status;

    //获取status
    function getStatus() external view returns(Status){
        return status;
    }

    //修改status
    function setStatus(Status _status) external{
        status=_status;
    }

    //设置status为Shipped
    function ship() external {
        status=Status.Shipped;
    }

    function reset() external {
        delete status;
    }
}