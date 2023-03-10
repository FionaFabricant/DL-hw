// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract AccessControl{
    //定义一个事件，叫做升级权限 对应地，也有一个事件，叫取消权限
    event GrantRole(bytes32 indexed  role,address indexed  account);  //indexed用于在链外查询针对哪个地址做了修改
    event RevokeRole(bytes32 indexed  role,address indexed  account);  //indexed用于在链外查询针对哪个地址做了修改

    //role=>account=>bool  角色role的映射  
    //字符串所消耗的gas比哈希值多得多  所以这里用哈希值bytes32存储角色role
    mapping(bytes32=>mapping(address=>bool)) public roles;

    bytes32 private constant ADMIN=keccak256(abi.encodePacked("ADMIN"));  //不希望外部获取到用户角色  常量名称大写
    bytes32 private constant USER=keccak256(abi.encodePacked("USER"));

    //升级角色
    //写内部外部两个函数，内部使用的函数用_区分
    function _grantRole(bytes32 _role,address _account) internal {   //合约可能会被继承 所以这个升级角色的函数要内部可视
        //修改映射中的值 要修改role和account和bool值
        //修改了变量的值之后，需要爆出一个事件，来向链外汇报我们所作出的修改
        roles[_role][_account]=true;    
        //这是个映射mapping啊，mapping(bytes32=>mapping(address=>bool)) role[_role]映射到mapping(address=>bool)，role[_role][_account]映射到bool
        emit GrantRole(_role, _account);
    } 

    //希望只有某个角色才能调用grantRole函数
    //所以写个onlyRole的修饰器
    modifier onlyRole(bytes32 _role){
        require(roles[_role][msg.sender],"not authorized");
        _; //_代表函数主体
    }

    //将管理员的权限赋予合约的部署者，通过构造函数初始化来实现
    constructor(){
        _grantRole(ADMIN,msg.sender);
    }

    //再写一个外部调用的升级权限的函数
    function grantRole(bytes32 _role,address _account) external onlyRole(ADMIN){  //只有admin能调用
        _grantRole(_role,_account);
    }

    //撤销权限的逻辑，将role[_role][_account]=true的true变成false就可以
    function revokeRole(bytes32 _role,address _account) external onlyRole(ADMIN){
        roles[_role][_account]=false; 
        emit RevokeRole(_role,_account);
    }
}