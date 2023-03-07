//modifier
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract FunctionModifier{
    bool public paused;
    uint public count;

    function pause(bool _paused) external{
        paused=_paused;
    }

    modifier whenNotPaused(){
        require(!paused,"status is paused");
        _;
    }

    function inc() external view whenNotPaused returns(uint){
        return count+1;
    }

    function dec() external view whenNotPaused returns(uint){
        return count-1;
    }

    //来个带参数的modifier
    modifier lessThanTen(uint _x){
        require(_x<10,"more than 10");
        _;
    }

    //y<10才+count
    function incByY(uint _y) external lessThanTen(_y){
        count+=_y;
    }

    //来个sandwich. modifier里面还能有操作
    modifier sandwich(){
        count+1000;
        _;
        count+99;
    }

    function foo() external view sandwich{
        count+10;
    }

}