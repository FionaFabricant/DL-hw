/*create an ethwallet again
create a ether wallet,创建owner,创建构造函数,
创建receive()方法，创建withdraw方法，创建getbalance方法
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract EthWallet{
    address payable public owner;

    //constructor
    constructor(){
        owner=payable(msg.sender);
    }

    receive() external payable{}

    function withdrawEth(uint _amount) external {
        require(owner==msg.sender,"not the owner");
        payable(msg.sender).transfer(_amount);
    }

    function getBalance() view external returns(uint) {
        return address(this).balance;
    }
}