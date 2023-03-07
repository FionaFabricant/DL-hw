//Array重拍和枚举
//SPDX-License-Identifier:MIT;
pragma solidity ^0.6.0;

contract Enum{
    enum Status{Pending,Shipped,Accepted,Rejected,Canceled} //枚举
    //Pending=0,Shipped=1,Accepted=2,Rejected=3,Canceled=4

    Status public status;  //类和对象？

    //set status
    function set(Status _status) public{
        status=_status;
    }

    //get status
    function get() public view returns(Status){
        return status;
    }

    //cancel
    function cancel() public{
        status=Status.Canceled;
    }

    //reset the status to the initial value 0
    function reset() public{
        delete status;
    }

}