//struct
//SPDX-License-Identifier:MIT;
pragma solidity ^0.6.0;

contract Todos{
    struct Todo{   //struct里可以存储多个不同类型的数据 表示复合型数据....
        string text;
        bool completed;   
    }

    //创建Todosarray
    Todo[] public todos;

    //给Todos数组赋值
    function create(string calldata _text) public{ //calldata调用数据
        todos.push(Todo(_text,false));

        todos.push(Todo({text:_text,completed:false}));

        Todo memory todo;
        todo.text=_text;

        todos.push(todo);
    }

    //getter
    function get(uint _index) public view returns(string memory text, bool completed){
        Todo storage todo=todos[_index];    
        return(todo.text,todo.completed);
    }

    //updateText
    function updateText(uint _index,string calldata _text) public{
        Todo storage todo=todos[_index];
        todo.text==_text;
    }

    //update completed
    function updateCompleted(uint _index)public{
        Todo storage todo=todos[_index];
        todo.completed=!todo.completed;
    }
}