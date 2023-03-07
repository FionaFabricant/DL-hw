// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

/*创建新合约的两种方法
contract x=new contract{value:_value}(params)
新地址=hash(创建者地址,nonce)

删除合约selfdestruct
selfdestruct(_addr); 其中_addr是接收合约中剩余ETH的地址。
*/