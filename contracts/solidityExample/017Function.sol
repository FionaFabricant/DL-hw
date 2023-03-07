//SPDX-License-Identifier:MIT;
pragma solidity ^0.6.0;

contract Function{
    //返回多个值
    function returnMany() public pure returns(uint,bool,uint){
        return(1,true,2);
    }
        

    //返回值可以命名
    function named() public pure returns(uint x,bool b,uint y){
        return(1,true,2);        
    }

    //return values can be assigned to their name
    //in this case the return statement can be omitted
    function assigned() public pure returns(uint  x,bool b,uint y){
        x=1;
        b=false;
        y=2;
    }

    //非结构化赋值
    function destructuringAssignments() public pure returns(uint,bool,uint,uint,uint){
        (uint i,bool b,uint j)=returnMany();
        //values can be left out
        (uint x,,uint y)=(4,5,6);
        return (i,b,j,x,y);
    }

    //can use array for input
    function arrayInput(uint[] memory _arr) public{}

    //can use array for output
    uint[] public arr;
    function arrayOutput() public view returns(uint[] memory){
        return arr;
    }

    uint num=10;
    function returnNum() public view returns(uint){
        return num;
    }

}