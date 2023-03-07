//SPDX-License-Identifier:MIT;
import "remix_tests.sol";
pragma solidity ^0.6.0;
import "./025Inheritance.sol";

contract F is A,B{
    function foo() public pure override(A,B) returns(string memory){
        return super.foo(); //返回的是B ???
    }
}
