//SPDX-License-Identifier:MIT;
pragma solidity 0.6.0;

//无参数版本
/*
contract ForWhile{
    function addtotal() public pure returns(uint){
        uint num;
        for(uint i=0;i<10;i++){
            num=num+i;
        }   
        return num; 
    }
}
*/

//有参数版本
/*
contract ForWhile{
    function addtotal(uint _x) public pure returns(uint){
        uint num;
        for(uint i=0;i<_x;i++){
            num=num+i;
        }
        return num;
    }
}
*/

contract ForWhile{
    function loop() public pure returns(uint,uint){
        uint num;
        for(uint i=0;i<10;i++){
            if(i>5){
                break;
            }
            num=i;
        }

        uint j;
        while(j<10){
            j++;
        }
        return (num,j);
    }
}