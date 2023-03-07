

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

/*
how to send ether?
transfer(throw error),send(returns bool),call(returns bool) 

how to receive ether?
use receive() or fallback() functions
 receive() extenal payable{}
 fallback() external payable{}

 when to use receive() and when to use fallback()?
 receive is called when msg.data() is empty, otherwise fallback() is called
*/

contract ReceiveEther{
    //receive():function to received ether,when msg.data is empty
    receive() external payable{} 
    //fallback():function to received ether,when msg.data is not empty
    fallback() external payable{}  //so why "function" is not written here?

    function getBlance() public view returns(uint){
        return address(this).balance;
    }
}

contract SendEther{
    function sendViaTransfer(address payable _to) public payable{
        _to.transfer(msg.value);
    }

    function sendViaSend(address payable _to) public payable {
        bool sent=_to.send(msg.value);  //send returns bool
        require(sent,"failed to send");
    }

    function sendViaCall(address payable _to) public payable {
        (bool sent,bytes memory data)=_to.call{value:msg.value}("");
        require(sent,"failed to send ether");
    }
}



