// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract A{
    function foo() public virtual pure returns(string memory){
        return "A";
    }
}

contract B is A{
    function foo() public pure virtual override returns(string memory){
        return "B";
    }
}

contract C is A{
    function foo() public pure virtual override returns(string memory){
        return "C";
    }
}

contract F is B{
    function foo() public pure override returns(string memory){
        return "F";
    }
}

contract D is B,C{
    function foo() public pure override(B,C) returns(string memory){
        return super.foo();
    }
}



