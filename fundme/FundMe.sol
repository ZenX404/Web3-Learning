// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// 众筹合约要实现哪些功能？
// 1. 创建一个收款函数
// 2. 记录投资人并且查看
// 3. 在锁定期内，达到目标值，生产商可以提款
// 4. 在锁定期内，没有达到目标值，投资人在锁定期以后退款

contract FundMe {

    mapping(address => uint256) public fundersToAmount;

    // 设置最小投资金额，10**18表示10的18次方，1*10^18 wei = 1 ETH，这里设置的就是最少投资1ETH
    uint256 MINIMUM_VALUE = 1 * 10 ** 18; 

    // 收款函数
    // external可以被外部调用，但是不能在合约内部被调用
    // 如果该函数想要收取原生通证，比如如果我们在以太坊上部署智能合约，以太坊的原生通证就是ETH以太币，那么我们想要收取以太币的话就需要在该函数上加上payable关键字
    function fund() external payable {
        
        // require(condition, "") 当condition是false时，就会回退本次交易（revert），并提出相应的错误信息
        // 只有当condition是true时，才会成功执行本次交易
        require(msg.value >= MINIMUM_VALUE, "Send more ETH");
        // 记录下投资人的地址以及他投资了多少金额
        fundersToAmount[msg.sender] = msg.value;
    }

}