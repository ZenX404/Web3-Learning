// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// FundMe
// 1. 让FundMe的参与者，基于 mapping 来领取相应数量的通证
// 2. 让FundMe的参与者，transfer 通证
// 3. 在使用完成以后，需要burn 通证

// 引入ERC20标准合约
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
// 引入之前编写的众筹合约，用来获取其中的数据
import {FundMe} from "./FundMe.sol";