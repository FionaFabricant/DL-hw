// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract functionOutput{
    function multiOutput() public pure returns(uint,bool){
        return (1,true);
    }

    function namedOutput() public pure returns (uint x,bool y){
        return (1,true);
    }

    function assigned() public pure returns(uint x,bool y){
        x=1;
        y=true;
    }

    function destructingAssignment() public pure{
        (uint x1,bool y1) = multiOutput();
        (,bool y2)=namedOutput();
    }
}