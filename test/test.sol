// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract HelloWorld {
    // 只要是在合约中定义的变量，编译器就会默认将其设置为storage永久性存储，所以不用我们显式声明
    string strVar = "Hello World";

    /*
        solidity中有六种存储模式，只要是在智能合约中定义的变量都会以其中的某一种存储模式来进行存储
        1. storage  永久性存储 指只要是创建好了这个变量，在任何时间读取他，它的值都不会变，除非你对其进行修改操作，比如智能合约中的strVar变量，这个就是永久性存储
        2. memory  暂时性存储   被这个修饰的变量，在使用的时候可以被修改
        3. calldata  暂时性存储    被这个修饰的变量，在使用的时候不能被修改
        4. stack
        5. codes
        6. logs

        编译器比较只能，如果对于基础基础数据类型，比如uint、int8、int256等等这种基础数据类型，不管是在合约中声明还是函数中声明，都不需要我们去声明他的存储模式，编译器会自动给它赋予合适的存储模式
        但是如果是数据结构的话，比如结构体、数组、string(本质就是一个byte数组)、mapping等等这种复杂数据结构，在函数中就需要我们显式声明出它的存储模式，编译器无法帮我们字符赋予存储模式。但是如果实在合约中生命的变量，都不需要我们去声明其存储模式，默认都是storage永久性存储
    */

    // 1、读取
    // view关键字：如果函数中只会进行读取操作，不进行修改操作，我们可以给函数声明上view关键字。要养成良好的编程习惯
    // public关键字：可以被外界调用，也可以被内部调用，也可以被继承的子合约调用，拥有最宽泛的调用范围
    function sayHello() public view returns(string memory) {
        return addinfo(strVar);
    }

    // 2、修改
    function setHelloWorld(string memory newString) public {
        strVar = newString;
    }

    // 3、计算
    // pure关键字：该关键字表示函数只会进行运算操作（可以是对于入参进行处理操作），并不会修改合约中的变量值，也不会读取合约中的变量值。
    // internal关键字：该函数不能被外界调用，只能被合约内部函数调用
    function addinfo(string memory helloWorldStr) internal pure returns(string memory) {
        return string.concat(helloWorldStr, " from Frank's contract.");
    }

}