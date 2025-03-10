// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// 引入chainlink的预言机合约，用于获取链下汇率数据
// 如果引入预言机合约，就不能在本地部署测试了，需要把部署到测试网络中，才能够使用预言机
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

// 众筹合约要实现哪些功能？
// 1. 创建一个收款函数
// 2. 记录投资人并且查看
// 3. 在锁定期内，达到目标值，生产商可以提款
// 4. 在锁定期内，没有达到目标值，投资人在锁定期以后退款

contract FundMe {

    mapping(address => uint256) public fundersToAmount;

    // 引入AggregatorV3Interface预言机合约对象。在solidity中，一个合约就可以作为一个类型
    // 用internal修饰，表明只有当前合约内部的函数才能调用这个变量
    AggregatorV3Interface internal dataFeed;

    // 设置最小投资金额，10**18表示10的18次方，1*10^18 wei = 1 ETH
    uint256 MINIMUM_VALUE = 100 * 10 ** 18;  // 设置为最少投资100usd

    // 智能合约的构造函数
    constructor() {
        // 在构造函数中初始化喂价对象
        // 我们这里采用sepolia testnet（sepolia测试网络），所以在初始化的时候要传入chainlink中提供的sepolia测试网络地址（在sepolia测试网络中部署的预言机地址），这样才能调用到部署在测试网络上的预言机
        // 我们要把合约部署到什么网络上，下面这个初始化就要传入对应网络的预言机部署地址
        dataFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
    }


    // 收款函数
    // external可以被外部调用，但是不能在合约内部被调用
    // 如果该函数想要收取原生通证，比如如果我们在以太坊上部署智能合约，以太坊的原生通证就是ETH以太币，那么我们想要收取以太币的话就需要在该函数上加上payable关键字
    function fund() external payable {
        
        // require(condition, "") 当condition是false时，就会回退本次交易（revert），并提出相应的错误信息
        // 只有当condition是true时，才会成功执行本次交易
        require(convertEthToUds(msg.value) >= MINIMUM_VALUE, "Send more ETH");
        // 记录下投资人的地址以及他投资了多少金额
        fundersToAmount[msg.sender] = msg.value;
    }


    // 该函数返回 1ETH等于多少USD的价格
    // 该函数是AggregatorV3Interface预言机合约提供的
    function getChainlinkDataFeedLatestAnswer() public view returns (int) {
        // prettier-ignore
        (
            /* uint80 roundID */,
            int answer,
            /*uint startedAt*/,
            /*uint timeStamp*/,
            /*uint80 answeredInRound*/
        ) = dataFeed.latestRoundData();
        return answer;
    }

    function convertEthToUds(uint256 ethAmount) internal view returns (uint256) {
        // 获取1ETH能兑换多少usd
        uint256 ethPrice = uint256(getChainlinkDataFeedLatestAnswer());
        // 将eth换算为usd
        // (ETH amount) * (ETH price) = (ETH value)
        // 我们传入的ethAmount单位是wei，但是预言机返回的换算并不是按照wei换算的，所以相乘的结果还要除以10^8
        return ethAmount * ethPrice / (10 ** 8);

    }

     

}