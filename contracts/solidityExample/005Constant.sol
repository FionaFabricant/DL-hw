//SPDX-License-Identifier:GPL-3.0;
pragma solidity ^0.6.0; 

contract Constant{
    //constant：将变量变成常量了。constant修饰符代表这个变量是不能被修改的 这样储存的时候可以减少很多gas消耗
    address public constant My_Address=0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    uint public constant My_Uint=1234;
    address public test_address;

    function modify1() public{
        //My_Address用constant修饰的 已经是常量 不能修改
        //My_Address=0xdafea492d9c6733ae3d56b7ed1adb60692c98bc5;  

        //没用constant修饰的就可以修改
        test_address=0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    }
}