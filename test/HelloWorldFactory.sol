// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// 同一个sol文件中可以创建多个合约

// 1、可以引入其他文件中的合约，并且还可以在前面添加一个大括号来指定要引入文件中具体哪一个合约
import { HelloWorld } from "./test.sol";
// 2、也可以直接导入一个Url（比如GitHub仓库中的某一个代码的Url,写在引号内即可引入代码中的合约）
// import { HelloWorld } from "https://github.com/ZenX404/Web3-Learning/blob/main/test/test.sol";
// 3、还可以通过包引入，后面会再遇到，这也是生产中最主流的引入方式

contract HelloWorldFactory {
    HelloWorld hw;

    HelloWorld[] hws;

    function createHelloWorld() public {
        hw = new HelloWorld();
        hws.push(hw);
    }

    // 因为该函数只会进行读取操作，所以用view修饰符
    function getHelloWorldByIndex(uint256 _index) public view returns (HelloWorld) {
        return hws[_index];
    }

    // 修饰关键字可以每一个占一行，这样看起来更清楚
    function callSayHelloByFactory(uint256 _index, uint256 _id)
        public 
        view 
        returns (string memory) {
            return hws[_index].sayHello(_id);
    }

    // 该函数涉及到修改操作，所以就不能用view修饰了，就不要写修饰关键字了
    function callSetHelloWorldFromFactory(uint256 _index, string memory newString, uint256 _id) public {
        hws[_index].setHelloWorld(newString, _id);
    }

 
}