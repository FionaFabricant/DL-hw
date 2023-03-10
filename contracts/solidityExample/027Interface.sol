// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

/*
Interface:
cannot have any functions implement  //没有函数主体??
can inherit from other interfaces
all declared functions must be external
cannot declare a constructor
cannot declare state variables
*/

contract Counter{
    uint public count;

    function increment() external{
        count+=1;
    }
}

interface ICounter{
    function count() external view returns(uint);
    function increment() external;
}

contract myContract{
    function incrementCounter(address _counter) external{
        ICounter(_counter).increment();
    }

    function getCount(address _counter) external view returns(uint){
        return ICounter(_counter).count();
    }
}

//uniswap example
interface UniswapV2Factory{
    function getPair(address tokenA,address tokenB) external view returns (address pair);
}

interface UniswapV2Pair {
    function getReserves() external view returns(uint112 reserve0,uint112 reserva1,uint32 blockTimestampLast);
}

contract UniswapExample{
    address private factory=0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    address private dai=0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB;
    address private weth=0x5c6B0f7Bf3E7ce046039Bd8FABdfD3f9F5021678;

    function getTokenReserves() external view returns(uint,uint){
        address pair=UniswapV2Factory(factory).getPair(dai,weth);
        (uint reserve0,uint reserve1,) = UniswapV2Pair(pair).getReserves();
        return (reserve0,reserve1);
    }
}