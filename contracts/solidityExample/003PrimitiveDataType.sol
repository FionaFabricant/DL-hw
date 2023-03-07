/*primitive data type：
boolean
uint 非负整数
int
address 地址
byte
*/
//SPDX-License-Identifier:MIT
pragma solidity ^0.6.0;
contract Primitives{
    bool public boo=true; //bool类型初始默认值为false

    //类型uint和int
    /*uint:非负整数
    uint8是非负整数类型，最大值是2**8-1=255  即0到255；
    uint16是 
    */
    uint8 public a=0; //加上public，deploy之后才能看到这个值
    uint8 b=255;
    //uint8 c=256; //uint8的范围是0到255，那256就太大了 报错

    /*以此类推 uint16范围就是2的16次方-1=65535；
    */
    uint16 public d=257;
    uint16 e=65535;
    //uint16 f=65536; //uint16就是0到65535

    //uint是uint256的缩写 范围是0到2**256-1； 
    uint f=2**256-1;
    uint public g=2**256-2;

    //int 可以是负数
    int8 public num=-128; //int是整数类型 最小值是-2**7=-128; 最大值是2**7-1=127;即-128到127，也是256个数字
    int8 public num2=127;
    //int8 public num3=128;

    int public num3=-2**255;
    int public num4=2**255-1;//int的范围是-2*255到2*256-1

    //类型 address类型
    address public addr;   //address默认值是address: 0x0000000000000000000000000000000000000000
                            //address可以理解成银行卡的账号
    address public addr1=0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    //类型bytes 16进制的表示 0123467910abcdef
    bytes1 public b1;
    bytes1 public b2=0x8b;
}
