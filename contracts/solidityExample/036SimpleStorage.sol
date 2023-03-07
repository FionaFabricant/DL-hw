// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract SimpleStorage{
    string public text;

    //set the text
    function set(string calldata _text) external {  //这里用memory也可以 但是会消耗更多gas
        text=_text;
    }

    function get() external view returns(string memory) {
        return text;
    }
}