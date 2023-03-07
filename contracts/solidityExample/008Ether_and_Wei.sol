//ether and wei
//1ETH=10**18wei;

//SPDX-License-Identifier:MIT
pragma solidity ^0.6.0;

contract EtherUnites{
    //1 ETH=10**18 wei
    //wei是以太坊上gas的最小单位
    uint public oneWei=1 wei;

    bool public isOneWei=(oneWei==1);  //判断oneWei是否等于1；

    uint public oneEther=1 ether;

    bool public isOneEther=(1 ether==10**18 wei);   //判断1 ether是否等于10**18 wei

    //10**18即1e18
}