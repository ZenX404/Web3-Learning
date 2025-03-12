// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract FundToken {
    // 1. 通证的名字
    // 2. 通证的简称
    // 3. 通证的发行数量
    // 4. owner地址
    // 5. balance address => uint256

    // 通证名字
    string public tokenName;
    // 通证简称
    string public tokenSymbol;
    // 通证的发行数量
    uint256 public totalSupply;
    // 合约拥有者地址
    address public owner;
    // 每一个地址拥有的通证数量
    mapping(address => uint256) public balances;

    constructor(string memory _tokenName, string memory _tokenSymbol) {
        tokenName = _tokenName;
        tokenSymbol = _tokenSymbol;
        owner = msg.sender;
    }

    // mint函数: 获取通证（铸造通证）
    function mint(uint256 amountToMint) public {
        // 铸造amountToMint个通证给当前调用的地址
        balances[msg.sender] += amountToMint;
        totalSupply += amountToMint;
    }

    // transfer: 转移通证
    function transfer(address payee, uint256 amount) public {
        require(balances[msg.sender] >= amount, "You do not have enough balance to transfer");
        balances[msg.sender] -= amount;
        balances[payee] += amount;
    }

    // balanceOf: 查看某一个地址的通证数量
    function balanceOf(address addr) public view returns (uint) {
        return balances[addr];
    }
}