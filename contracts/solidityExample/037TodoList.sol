// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

//struct和array结合
contract TodoList{
    struct Todo{
        string text;
        bool completed;
    }

    Todo[] public todos;

    //将todos放进Todo数组中
    function create(string calldata _text) external {
        todos.push(Todo(_text,false));
    }

    //更新数组里的数据
    function updateText(uint _index,string calldata _text) external{
        //方法一
        todos[_index].text=_text;

        //方法二
        Todo storage todo=todos[_index];
        todo.text=_text;
    }

    //获取数据
    function get(uint _index) external view returns(string memory,bool){
        Todo memory todo=todos[_index];  //换成storage也行
        return (todo.text,todo.completed);
    }

    //completed取相反值
    function toggleCompleted(uint _index) external {
        todos[_index].completed=!todos[_index].completed; //将completed的状态变成opposite的
    }
}