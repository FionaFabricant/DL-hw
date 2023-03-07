/*
验证签名的四个步骤:
1.将消息进行签名 message to sign
2.将消息进行哈希值 hash(message)
3.将消息和私钥进行签名 sigh(hash(message),private key)    线下进行
4.恢复签名 ecrecover(hash(message),signature)==signer

*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract VerifySig{
    function verify(address _signer,string memory _message,bytes memory _sig) external pure returns(bool){
        //参数分别是：签名人的地址,要签名的数据原文,签名的结果

        //1.对输入的消息进行哈希算法
        bytes32 messageHash=getMessageHash(_message);
        //把消息的哈希值再做一次算法： ETH的签名    这是第三步：将消息和私钥进行签名 sigh(hash(message),private key)   线下进行
        bytes32 ethSignedMessageHash=getEthSignedMessageHash(messageHash);

        //判断进行了两次哈希签名的数据，和签名的结果，是不是相符
        return recover(ethSignedMessageHash,_sig)==_signer;

        //为什么要进行两次哈希运算，因为一次哈希运算在数学界已经有被破解的可能性了
    }

    //定义三个函数getMessageHash()，getEthSignedMessageHash()，recover()

    //getMessageHash() function
    function getMessageHash(string memory _message) public pure returns(bytes32){
        return keccak256(abi.encodePacked(_message));
    }
    //getEthSignedMessageHash() function   //用的参数是getMessageHash()的结果 所以是bytes32格式
    function getEthSignedMessageHash(bytes32 _messageHash) public pure returns(bytes32){
        //在链下签名的时候 会把哈希值再增加一个字符串  "\x19Ethereum Signed Message:\n32"
        return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32",_messageHash));
    }
    //recover() function  //recover一个参数是两次哈希运算之后的数据结果，一个是签名的结果
    function recover(bytes32 _ethSignedMessageHash,bytes memory _sig) public pure returns(address){
        (bytes32 r,bytes32 s,uint8 v)=_split(_sig);    //r s v：非对称信息加密将信息签名成三个变量，将这个三个变量拼接在一起就是我们签名的数据
        return ecrecover(_ethSignedMessageHash, v, r, s);   //用ecrecover恢复签名，固定地返回还原之后的地址
    }

    function _split(bytes memory _sig) internal pure returns(bytes32 r, bytes32 s, uint8 v){
        require(_sig.length==65,"invalid signature length");  //为啥65位？参数里bytes32+bytes32+uint1位=65位

        //用汇编进行分割
        //内联汇编  0到32，33到64，65
        assembly{
            r :=mload(add(_sig,32))  //跳过前面32位
            s :=mload(add(_sig,64))  //跳过前面64位
            v :=byte(0,mload(add(_sig,96)))  //跳过前面94位
        }
    }
    

}