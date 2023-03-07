// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract onlyOwner{
    address public owner;

    constructor(){
        owner=msg.sender;
    }

    modifier onlyOwner1{
        require(owner==msg.sender,"u not the owner");
        _;
    }

    function setOwner(address _newOwner) external onlyOwner1{
        require(_newOwner!=address(0),"this is address0");
        owner=_newOwner;
    }

    function onlyOwnerCanCallThisFunction() external onlyOwner1{

    }

    function anyOneCanCall() external{
        
    }

}