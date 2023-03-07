// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Struct{
    //建个struct
    struct Car{
        string brand;
        uint year;
        address owner;
    }

    //创建个Car实例
    Car public car;
    Car[] public cars;
    mapping(address=>Car[]) public carsByOwner;

    function examples() external{
         //创建个car对象
        Car memory toyota=Car("toyota",1990,msg.sender);
        Car memory lambo=Car({year:2000,brand:"lamboghini",owner:msg.sender});
        Car memory tesla;
        tesla.brand="model Y";
        tesla.year=2015;
        tesla.owner=msg.sender;

        //将各个car放进cars数组
        cars.push(toyota);
        cars.push(lambo);
        cars.push(tesla);

        //直接创建一个Car实例放进cars数组里
        cars.push(Car("ferrari",1970,msg.sender));

        //获取cars数组里的数据
        Car storage _car=cars[0];

        //修改数据 要把_car放在storage 因为memory在执行完之后不再存在
        _car.year=1990;  

        //数据变成default值
        delete _car.owner;

        delete cars[1];
    }    
}