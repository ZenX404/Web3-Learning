// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// FundMe
// 1. 让FundMe的参与者，基于 mapping 来领取相应数量的通证
// 2. 让FundMe的参与者，transfer 通证
// 3. 在使用完成以后，需要burn 通证（销毁通证）

// 引入ERC20标准合约
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
// 引入之前编写的众筹合约，用来获取其中的数据
import {FundMe} from "./FundMe.sol";

contract FundTokenERC20 is ERC20 {
    // 引入自己编写的FundMe众筹合约
    FundMe fundMe;

    // constructor后面直接写ERC20()表示使用父合约ERC20的构造函数
    // 我们也可以同时编写我们自己写的构造函数
    constructor(address fundMeAddr) ERC20("FundTokenERC20", "FT") {
        // 引入我们之前写的智能合约，这样就可以获得该智能合约中的数据
        fundMe = FundMe(fundMeAddr);
    }


    // 让FundMe的参与者，基于 mapping 来领取相应数量的通证
    function mint(uint256 amountToMint) public {
        // 这里获取fundersToAmount数据用的是()，而不是[]
        // 在外部合约（如FunfTokenERC20）中，你需要通过调用这个自动生成的getter函数来获取映射的值。由于这是一个函数调用，必须使用**圆括号()**传递参数：
        // 外部合约无法直接访问另一个合约的内部状态变量（如fundersToAmount）。唯一的访问方式是通过公共getter函数，而调用函数必须使用圆括号。
        /*
            之所以这里可以用()，是因为在Solidity中，当你声明一个public的状态变量（如映射或数组）时，
            编译器会自动生成一个同名的getter函数。
            这个getter函数允许外部合约通过函数调用的方式访问该状态变量的值。
            对于映射类型的变量，其自动生成的getter函数需要传入键（key）作为参数，
            因此需要使用**圆括号()**来传递参数，而非数组或映射直接访问时的方括号[]。
        */
        require(fundMe.fundersToAmount(msg.sender) >= amountToMint, "You cannot mint this many tokens");
        // 需要等生产商完成提款之后，才可以进行领取通证的操作
        // 编译器会自动为public修饰的变量生成getter函数，在调用外部合约的变量时，需要通过getter函数获取
        require(fundMe.getFundSuccess(), "The fundme is not completed yet");

        // 调用ERC20标准合约中提供的mint函数，来铸造通证
        _mint(msg.sender, amountToMint);
        // 要将该投资者的余额进行相应的扣除
        fundMe.setFunderToAmount(msg.sender, fundMe.fundersToAmount(msg.sender) - amountToMint);
    }


    // 让FundMe的参与者，transfer 通证
    // 这个功能不需要我们自己写了，ERC20标准合约已经提供了这个函数
    


    // 在使用完成以后（使用通证兑换商品），需要burn 通证
    function claim(uint amountToClaim) public {
        // complate claim  使用通证完成兑换  兑换需要使用amountToClaim个token
        require(balanceOf(msg.sender) >= amountToClaim, "You dont have enough ERC20 tokens");
        // 需要等生产商完成提款之后，才可以进行兑换操作
        require(fundMe.getFundSuccess(), "The fundme is not completed yet");
        
        /*编写相关的兑换逻辑*/

        // burn amountToClaim tokens  销毁已经使用的tokens
        // 销毁token直接使用ERC20标准合约提供的函数，不用自己编写
        _burn(msg.sender, amountToClaim);
        
    }
}