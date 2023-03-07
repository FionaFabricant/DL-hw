//SPDX-License-Identifier:MIT;
pragma solidity ^0.6.0;

//array的delete方法，不是将元素删除，而是将元素变为0。那么怎么将元素删除呢？
//array怎么remove元素的？被删除的元素后面的元素都往前挪一位 然后删除掉最后一个元素
//
contract ArrayRemoveByShifting{
    uint[] public arr=[2,4,6,8,10,12,14,16];    //新建一个数组啊

    function  remove(uint _index)public{
        require(_index<arr.length,"index out of bound");  //require函数 //要求_index<arr.length 否则就输出“。。”

        //后面元素往前挪一位
        for(uint i=_index;i<arr.length-1;i++){
            arr[i]=arr[i+1];
        }
        //删掉最后一个元素
        arr.pop();
    }
    function getArray() public view returns(uint[] memory){ //返回array记得加上memory
        return arr;
    }
}




