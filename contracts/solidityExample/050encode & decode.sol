/*
solidity中 ABI编码有四个
1.abi.encode(arg);       
result = abi.encode(x, addr, name, array);   
将每个数据都填充为32字节，中间有很多0。

2.abi.encodePacked(arg);
result = abi.encodePacked(x, addr, name, array);
类似 abi.encode，但是会把其中填充的很多0省略,长度比abi.encode短很多。

3.abi.encodeWithSignature(signatureString, arg);
result = abi.encodeWithSignature("foo(uint256,address,string,uint256[2])", x, addr, name, array);
与abi.encode功能类似，只不过第一个参数为函数签名，比如"foo(uint256,address)"。当调用其他合约的时候可以使用。

4.abi.encodeWithSelector(bytes4, arg);
result = abi.encodeWithSelector(bytes4(keccak256("foo(uint256,address,string,uint256[2])")), x, addr, name, array);
与abi.encodeWithSignature功能类似，只不过第一个参数为函数选择器，为函数签名Keccak哈希的前4个字节。

而abi解码有一个函数
abi.decode  用于解码abi.encode的数据. (dx, daddr, dname, darray) = abi.decode(data, (uint, address, string, uint[2]));
(dx, daddr, dname, darray) = abi.decode(data, (uint, address, string, uint[2]));
abi.decode用于解码abi.encode生成的二进制编码，将它还原成原本的参数。

为什么要有ABI?
为了和智能合约交互
ABI:application binary interface应用二进制接口
*/