// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

/*去除array中某个元素的第二个方法
先将最后一个元素复制到要去除元素的位置 然后用pop()去掉最后一个元素
优点是比上一种方法(将后面的元素都往前移一位，然后去掉最后一个元素)省gas
缺点是顺序变了
*/
contract ArrayReplaceLast{
    uint[] public arr;
    function remove(uint _index) public{
        arr[_index]=arr[arr.length-1];
        arr.pop();
    }

    function test() external {
        arr=[1,2,3,4];
        remove(1);

        //结果应该是[1,4,3]
        //用assert检验
        assert(arr[0]==1);
        assert(arr[1]==4);
        assert(arr[2]==3);
        assert(arr.length==3);

        //再去除一个2index的 结果应该是[1,4]
        remove(2);
        assert(arr[0]==1);
        assert(arr[1]==4);
        assert(arr.length==2);
    }
}