//if...else if...else
//SPDX-License-Identifier:MIT
pragma solidity ^0.6.0;

contract IFElse{
    function foo(uint x) public pure returns(uint){
        if(x<10){
            return 0;
        }else if(x<20){
            return 1;
        }else{
            return 2;
        }
    }

    function ternary(uint _x) public pure returns(uint){  //三元判断
        return _x < 10 ? 1 : 2;  //如果_x<10就return 1，否则就return 2
    }
}