// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// 同一个sol文件中可以创建多个合约

// 1、可以引入其他文件中的合约，也可以指定要引入哪一个合约
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

 
}