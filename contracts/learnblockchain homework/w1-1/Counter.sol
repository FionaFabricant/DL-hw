// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

//interface
interface ICounter{
    function count() external view returns(uint);
    function inc() external;
    function dec() external;
}

contract CallInterface{
    uint public count;
    function examples(address _counter) external{
        ICounter(_counter).inc();
        ICounter(_counter).count();

    }
}
