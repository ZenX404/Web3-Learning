// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

abstract contract Parent {
    uint256 public a;
    // private修饰的变量不能被继承
    uint256 private b = 10;

    function addOne() public {
        a++;
    }

    // 用virtual修饰的函数叫做虚函数，我觉得有点类似Java中的抽象函数
    // 也就是说虚函数可以不用实现（当然也可以实现），而是由继承该合约的子合约去重写实现
    // 注意只有抽象合约（abstract contract）才能有虚函数
    function addThree() public virtual;
}

// 一个.sol文件中可以写两个合约
// solidity中继承使用 is 来实现，它就相当于Java中的extends
// Child继承Parent，就可以直接使用Parent的成员变量
contract Child is Parent {

    function addTwo() public {
        a += 2;
    }

    // override表示重写父合约的虚函数
    function addThree() public override {
        a += 3;
    }
}