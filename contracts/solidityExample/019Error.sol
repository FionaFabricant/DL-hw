//Error 抛出异常的三种方法require revert和assert

//SPDX-License-Identifier:MIT;
pragma solidity ^0.6.0;

contract Error{
    function testRequire(uint _i)public pure{
        require(_i<10,"i must be less than 10"); //要求i<0，否则抛出异常“..”
    }

    function testRevert(uint _i) public pure{
        if(_i>=10){
            revert("i must be less than 10");  //如果i>=10就抛出异常“..”
        }
    }

    //Assert should only be used to test for internal errors, 
    //and to check invariants.
    uint public num;
    function testAssert() public view{
        assert(num==10);
    }

    //custom error
    function testCustomError(uint _withdrwaAmount) public view{
        uint bal=address(this).balance;
        if(bal<_withdrwaAmount){
            revert InsufficientBalance({balance:bal,withdrawAmount:_withdrwaAmount});
        }
    }
    error InsufficientBalance(uint balance,uint withdrawAmount);
}