// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract A{
    uint count;
    function increment() external{
        count+=1;
    }
}

interface ICounter {
    function count() external view returns(uint);
    function increment() external;
}

contract B{
    function CountB(address _counter) external view returns(uint){
        return ICounter(_counter).count();
    }

    function IncrementB(address _counter) external{
        ICounter(_counter).increment();
    }
}

interface UniswapV2Factory {
    function getPair(address tokenA,address tokenB) external view returns(address pair);
}

interface UniswapV2Pair {
    function getReserves() external view returns(uint112 reserve0,uint112 reserve1,uint32 blockTimstampLast);
}

contract UniswapExample{
    address private factory=0x5c6B0f7Bf3E7ce046039Bd8FABdfD3f9F5021678;
    address private dai=0x03C6FcED478cBbC9a4FAB34eF9f40767739D1Ff7;
    address private wei0=0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db;

    function getTokenReserves() external view returns (uint,uint){
        address pair=UniswapV2Factory(factory).getPair(dai,wei0);
        (uint reserve0,uint reserve1,)=UniswapV2Pair(pair).getReserves();
        return (reserve0,reserve1);
    }
}