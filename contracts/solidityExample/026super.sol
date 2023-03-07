// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract A{
    event Log(string mmessage);
    function foo() public virtual{
        emit Log("A.foo is called");
    }

    function bar() public virtual{
        emit Log("A.bar is called");
    }
}

contract B is A{
    function foo() public virtual override{
        emit Log("B.foo called");
        A.foo();
    }

    function bar() public virtual override{
        emit Log("B.bar called");
        super.bar();
    }
}

contract C is A{
    function foo() public virtual override{
        emit Log("C.foo called");
        A.foo();
    }

    function bar() public virtual override{
        emit Log("C.bar called");
        super.bar();
    }
}

contract D is B,C{
    function foo() public override(B,C){
        emit Log("D.foo called");
        super.foo();
    }

    function bar() public override(B,C){
        emit Log("D.bar called");
        super.bar();
    }
}