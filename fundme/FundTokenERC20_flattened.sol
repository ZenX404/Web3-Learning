// SPDX-License-Identifier: MIT
// File: @openzeppelin/contracts/token/ERC20/IERC20.sol


// OpenZeppelin Contracts (last updated v5.1.0) (token/ERC20/IERC20.sol)

pragma solidity ^0.8.20;

/**
 * @dev Interface of the ERC-20 standard as defined in the ERC.
 */
interface IERC20 {
    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);

    /**
     * @dev Returns the value of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the value of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves a `value` amount of tokens from the caller's account to `to`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address to, uint256 value) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets a `value` amount of tokens as the allowance of `spender` over the
     * caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 value) external returns (bool);

    /**
     * @dev Moves a `value` amount of tokens from `from` to `to` using the
     * allowance mechanism. `value` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address from, address to, uint256 value) external returns (bool);
}

// File: @openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol


// OpenZeppelin Contracts (last updated v5.1.0) (token/ERC20/extensions/IERC20Metadata.sol)

pragma solidity ^0.8.20;


/**
 * @dev Interface for the optional metadata functions from the ERC-20 standard.
 */
interface IERC20Metadata is IERC20 {
    /**
     * @dev Returns the name of the token.
     */
    function name() external view returns (string memory);

    /**
     * @dev Returns the symbol of the token.
     */
    function symbol() external view returns (string memory);

    /**
     * @dev Returns the decimals places of the token.
     */
    function decimals() external view returns (uint8);
}

// File: @openzeppelin/contracts/utils/Context.sol


// OpenZeppelin Contracts (last updated v5.0.1) (utils/Context.sol)

pragma solidity ^0.8.20;

/**
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }

    function _contextSuffixLength() internal view virtual returns (uint256) {
        return 0;
    }
}

// File: @openzeppelin/contracts/interfaces/draft-IERC6093.sol


// OpenZeppelin Contracts (last updated v5.1.0) (interfaces/draft-IERC6093.sol)
pragma solidity ^0.8.20;

/**
 * @dev Standard ERC-20 Errors
 * Interface of the https://eips.ethereum.org/EIPS/eip-6093[ERC-6093] custom errors for ERC-20 tokens.
 */
interface IERC20Errors {
    /**
     * @dev Indicates an error related to the current `balance` of a `sender`. Used in transfers.
     * @param sender Address whose tokens are being transferred.
     * @param balance Current balance for the interacting account.
     * @param needed Minimum amount required to perform a transfer.
     */
    error ERC20InsufficientBalance(address sender, uint256 balance, uint256 needed);

    /**
     * @dev Indicates a failure with the token `sender`. Used in transfers.
     * @param sender Address whose tokens are being transferred.
     */
    error ERC20InvalidSender(address sender);

    /**
     * @dev Indicates a failure with the token `receiver`. Used in transfers.
     * @param receiver Address to which tokens are being transferred.
     */
    error ERC20InvalidReceiver(address receiver);

    /**
     * @dev Indicates a failure with the `spender`’s `allowance`. Used in transfers.
     * @param spender Address that may be allowed to operate on tokens without being their owner.
     * @param allowance Amount of tokens a `spender` is allowed to operate with.
     * @param needed Minimum amount required to perform a transfer.
     */
    error ERC20InsufficientAllowance(address spender, uint256 allowance, uint256 needed);

    /**
     * @dev Indicates a failure with the `approver` of a token to be approved. Used in approvals.
     * @param approver Address initiating an approval operation.
     */
    error ERC20InvalidApprover(address approver);

    /**
     * @dev Indicates a failure with the `spender` to be approved. Used in approvals.
     * @param spender Address that may be allowed to operate on tokens without being their owner.
     */
    error ERC20InvalidSpender(address spender);
}

/**
 * @dev Standard ERC-721 Errors
 * Interface of the https://eips.ethereum.org/EIPS/eip-6093[ERC-6093] custom errors for ERC-721 tokens.
 */
interface IERC721Errors {
    /**
     * @dev Indicates that an address can't be an owner. For example, `address(0)` is a forbidden owner in ERC-20.
     * Used in balance queries.
     * @param owner Address of the current owner of a token.
     */
    error ERC721InvalidOwner(address owner);

    /**
     * @dev Indicates a `tokenId` whose `owner` is the zero address.
     * @param tokenId Identifier number of a token.
     */
    error ERC721NonexistentToken(uint256 tokenId);

    /**
     * @dev Indicates an error related to the ownership over a particular token. Used in transfers.
     * @param sender Address whose tokens are being transferred.
     * @param tokenId Identifier number of a token.
     * @param owner Address of the current owner of a token.
     */
    error ERC721IncorrectOwner(address sender, uint256 tokenId, address owner);

    /**
     * @dev Indicates a failure with the token `sender`. Used in transfers.
     * @param sender Address whose tokens are being transferred.
     */
    error ERC721InvalidSender(address sender);

    /**
     * @dev Indicates a failure with the token `receiver`. Used in transfers.
     * @param receiver Address to which tokens are being transferred.
     */
    error ERC721InvalidReceiver(address receiver);

    /**
     * @dev Indicates a failure with the `operator`’s approval. Used in transfers.
     * @param operator Address that may be allowed to operate on tokens without being their owner.
     * @param tokenId Identifier number of a token.
     */
    error ERC721InsufficientApproval(address operator, uint256 tokenId);

    /**
     * @dev Indicates a failure with the `approver` of a token to be approved. Used in approvals.
     * @param approver Address initiating an approval operation.
     */
    error ERC721InvalidApprover(address approver);

    /**
     * @dev Indicates a failure with the `operator` to be approved. Used in approvals.
     * @param operator Address that may be allowed to operate on tokens without being their owner.
     */
    error ERC721InvalidOperator(address operator);
}

/**
 * @dev Standard ERC-1155 Errors
 * Interface of the https://eips.ethereum.org/EIPS/eip-6093[ERC-6093] custom errors for ERC-1155 tokens.
 */
interface IERC1155Errors {
    /**
     * @dev Indicates an error related to the current `balance` of a `sender`. Used in transfers.
     * @param sender Address whose tokens are being transferred.
     * @param balance Current balance for the interacting account.
     * @param needed Minimum amount required to perform a transfer.
     * @param tokenId Identifier number of a token.
     */
    error ERC1155InsufficientBalance(address sender, uint256 balance, uint256 needed, uint256 tokenId);

    /**
     * @dev Indicates a failure with the token `sender`. Used in transfers.
     * @param sender Address whose tokens are being transferred.
     */
    error ERC1155InvalidSender(address sender);

    /**
     * @dev Indicates a failure with the token `receiver`. Used in transfers.
     * @param receiver Address to which tokens are being transferred.
     */
    error ERC1155InvalidReceiver(address receiver);

    /**
     * @dev Indicates a failure with the `operator`’s approval. Used in transfers.
     * @param operator Address that may be allowed to operate on tokens without being their owner.
     * @param owner Address of the current owner of a token.
     */
    error ERC1155MissingApprovalForAll(address operator, address owner);

    /**
     * @dev Indicates a failure with the `approver` of a token to be approved. Used in approvals.
     * @param approver Address initiating an approval operation.
     */
    error ERC1155InvalidApprover(address approver);

    /**
     * @dev Indicates a failure with the `operator` to be approved. Used in approvals.
     * @param operator Address that may be allowed to operate on tokens without being their owner.
     */
    error ERC1155InvalidOperator(address operator);

    /**
     * @dev Indicates an array length mismatch between ids and values in a safeBatchTransferFrom operation.
     * Used in batch transfers.
     * @param idsLength Length of the array of token identifiers
     * @param valuesLength Length of the array of token amounts
     */
    error ERC1155InvalidArrayLength(uint256 idsLength, uint256 valuesLength);
}

// File: @openzeppelin/contracts/token/ERC20/ERC20.sol


// OpenZeppelin Contracts (last updated v5.2.0) (token/ERC20/ERC20.sol)

pragma solidity ^0.8.20;





/**
 * @dev Implementation of the {IERC20} interface.
 *
 * This implementation is agnostic to the way tokens are created. This means
 * that a supply mechanism has to be added in a derived contract using {_mint}.
 *
 * TIP: For a detailed writeup see our guide
 * https://forum.openzeppelin.com/t/how-to-implement-erc20-supply-mechanisms/226[How
 * to implement supply mechanisms].
 *
 * The default value of {decimals} is 18. To change this, you should override
 * this function so it returns a different value.
 *
 * We have followed general OpenZeppelin Contracts guidelines: functions revert
 * instead returning `false` on failure. This behavior is nonetheless
 * conventional and does not conflict with the expectations of ERC-20
 * applications.
 */
abstract contract ERC20 is Context, IERC20, IERC20Metadata, IERC20Errors {
    mapping(address account => uint256) private _balances;

    mapping(address account => mapping(address spender => uint256)) private _allowances;

    uint256 private _totalSupply;

    string private _name;
    string private _symbol;

    /**
     * @dev Sets the values for {name} and {symbol}.
     *
     * All two of these values are immutable: they can only be set once during
     * construction.
     */
    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }

    /**
     * @dev Returns the name of the token.
     */
    function name() public view virtual returns (string memory) {
        return _name;
    }

    /**
     * @dev Returns the symbol of the token, usually a shorter version of the
     * name.
     */
    function symbol() public view virtual returns (string memory) {
        return _symbol;
    }

    /**
     * @dev Returns the number of decimals used to get its user representation.
     * For example, if `decimals` equals `2`, a balance of `505` tokens should
     * be displayed to a user as `5.05` (`505 / 10 ** 2`).
     *
     * Tokens usually opt for a value of 18, imitating the relationship between
     * Ether and Wei. This is the default value returned by this function, unless
     * it's overridden.
     *
     * NOTE: This information is only used for _display_ purposes: it in
     * no way affects any of the arithmetic of the contract, including
     * {IERC20-balanceOf} and {IERC20-transfer}.
     */
    function decimals() public view virtual returns (uint8) {
        return 18;
    }

    /**
     * @dev See {IERC20-totalSupply}.
     */
    function totalSupply() public view virtual returns (uint256) {
        return _totalSupply;
    }

    /**
     * @dev See {IERC20-balanceOf}.
     */
    function balanceOf(address account) public view virtual returns (uint256) {
        return _balances[account];
    }

    /**
     * @dev See {IERC20-transfer}.
     *
     * Requirements:
     *
     * - `to` cannot be the zero address.
     * - the caller must have a balance of at least `value`.
     */
    function transfer(address to, uint256 value) public virtual returns (bool) {
        address owner = _msgSender();
        _transfer(owner, to, value);
        return true;
    }

    /**
     * @dev See {IERC20-allowance}.
     */
    function allowance(address owner, address spender) public view virtual returns (uint256) {
        return _allowances[owner][spender];
    }

    /**
     * @dev See {IERC20-approve}.
     *
     * NOTE: If `value` is the maximum `uint256`, the allowance is not updated on
     * `transferFrom`. This is semantically equivalent to an infinite approval.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function approve(address spender, uint256 value) public virtual returns (bool) {
        address owner = _msgSender();
        _approve(owner, spender, value);
        return true;
    }

    /**
     * @dev See {IERC20-transferFrom}.
     *
     * Skips emitting an {Approval} event indicating an allowance update. This is not
     * required by the ERC. See {xref-ERC20-_approve-address-address-uint256-bool-}[_approve].
     *
     * NOTE: Does not update the allowance if the current allowance
     * is the maximum `uint256`.
     *
     * Requirements:
     *
     * - `from` and `to` cannot be the zero address.
     * - `from` must have a balance of at least `value`.
     * - the caller must have allowance for ``from``'s tokens of at least
     * `value`.
     */
    function transferFrom(address from, address to, uint256 value) public virtual returns (bool) {
        address spender = _msgSender();
        _spendAllowance(from, spender, value);
        _transfer(from, to, value);
        return true;
    }

    /**
     * @dev Moves a `value` amount of tokens from `from` to `to`.
     *
     * This internal function is equivalent to {transfer}, and can be used to
     * e.g. implement automatic token fees, slashing mechanisms, etc.
     *
     * Emits a {Transfer} event.
     *
     * NOTE: This function is not virtual, {_update} should be overridden instead.
     */
    function _transfer(address from, address to, uint256 value) internal {
        if (from == address(0)) {
            revert ERC20InvalidSender(address(0));
        }
        if (to == address(0)) {
            revert ERC20InvalidReceiver(address(0));
        }
        _update(from, to, value);
    }

    /**
     * @dev Transfers a `value` amount of tokens from `from` to `to`, or alternatively mints (or burns) if `from`
     * (or `to`) is the zero address. All customizations to transfers, mints, and burns should be done by overriding
     * this function.
     *
     * Emits a {Transfer} event.
     */
    function _update(address from, address to, uint256 value) internal virtual {
        if (from == address(0)) {
            // Overflow check required: The rest of the code assumes that totalSupply never overflows
            _totalSupply += value;
        } else {
            uint256 fromBalance = _balances[from];
            if (fromBalance < value) {
                revert ERC20InsufficientBalance(from, fromBalance, value);
            }
            unchecked {
                // Overflow not possible: value <= fromBalance <= totalSupply.
                _balances[from] = fromBalance - value;
            }
        }

        if (to == address(0)) {
            unchecked {
                // Overflow not possible: value <= totalSupply or value <= fromBalance <= totalSupply.
                _totalSupply -= value;
            }
        } else {
            unchecked {
                // Overflow not possible: balance + value is at most totalSupply, which we know fits into a uint256.
                _balances[to] += value;
            }
        }

        emit Transfer(from, to, value);
    }

    /**
     * @dev Creates a `value` amount of tokens and assigns them to `account`, by transferring it from address(0).
     * Relies on the `_update` mechanism
     *
     * Emits a {Transfer} event with `from` set to the zero address.
     *
     * NOTE: This function is not virtual, {_update} should be overridden instead.
     */
    function _mint(address account, uint256 value) internal {
        if (account == address(0)) {
            revert ERC20InvalidReceiver(address(0));
        }
        _update(address(0), account, value);
    }

    /**
     * @dev Destroys a `value` amount of tokens from `account`, lowering the total supply.
     * Relies on the `_update` mechanism.
     *
     * Emits a {Transfer} event with `to` set to the zero address.
     *
     * NOTE: This function is not virtual, {_update} should be overridden instead
     */
    function _burn(address account, uint256 value) internal {
        if (account == address(0)) {
            revert ERC20InvalidSender(address(0));
        }
        _update(account, address(0), value);
    }

    /**
     * @dev Sets `value` as the allowance of `spender` over the `owner` s tokens.
     *
     * This internal function is equivalent to `approve`, and can be used to
     * e.g. set automatic allowances for certain subsystems, etc.
     *
     * Emits an {Approval} event.
     *
     * Requirements:
     *
     * - `owner` cannot be the zero address.
     * - `spender` cannot be the zero address.
     *
     * Overrides to this logic should be done to the variant with an additional `bool emitEvent` argument.
     */
    function _approve(address owner, address spender, uint256 value) internal {
        _approve(owner, spender, value, true);
    }

    /**
     * @dev Variant of {_approve} with an optional flag to enable or disable the {Approval} event.
     *
     * By default (when calling {_approve}) the flag is set to true. On the other hand, approval changes made by
     * `_spendAllowance` during the `transferFrom` operation set the flag to false. This saves gas by not emitting any
     * `Approval` event during `transferFrom` operations.
     *
     * Anyone who wishes to continue emitting `Approval` events on the`transferFrom` operation can force the flag to
     * true using the following override:
     *
     * ```solidity
     * function _approve(address owner, address spender, uint256 value, bool) internal virtual override {
     *     super._approve(owner, spender, value, true);
     * }
     * ```
     *
     * Requirements are the same as {_approve}.
     */
    function _approve(address owner, address spender, uint256 value, bool emitEvent) internal virtual {
        if (owner == address(0)) {
            revert ERC20InvalidApprover(address(0));
        }
        if (spender == address(0)) {
            revert ERC20InvalidSpender(address(0));
        }
        _allowances[owner][spender] = value;
        if (emitEvent) {
            emit Approval(owner, spender, value);
        }
    }

    /**
     * @dev Updates `owner` s allowance for `spender` based on spent `value`.
     *
     * Does not update the allowance value in case of infinite allowance.
     * Revert if not enough allowance is available.
     *
     * Does not emit an {Approval} event.
     */
    function _spendAllowance(address owner, address spender, uint256 value) internal virtual {
        uint256 currentAllowance = allowance(owner, spender);
        if (currentAllowance < type(uint256).max) {
            if (currentAllowance < value) {
                revert ERC20InsufficientAllowance(spender, currentAllowance, value);
            }
            unchecked {
                _approve(owner, spender, currentAllowance - value, false);
            }
        }
    }
}

// File: @chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol


pragma solidity ^0.8.0;

interface AggregatorV3Interface {
  function decimals() external view returns (uint8);

  function description() external view returns (string memory);

  function version() external view returns (uint256);

  function getRoundData(
    uint80 _roundId
  ) external view returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound);

  function latestRoundData()
    external
    view
    returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound);
}

// File: fundme/FundMe.sol


pragma solidity ^0.8.20;

// 引入chainlink的预言机合约，用于获取链下汇率数据
// 如果引入预言机合约，就不能在本地部署测试了，需要把部署到测试网络中，才能够使用预言机


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
    uint256 constant MINIMUM_VALUE = 100 * 10 ** 18;  // 设置为最少投资100usd

    // 设置众筹合约的目标值
    // constant修饰后就会变成常量，该值就无法被修改了。常量一般用大写字母命名
    uint256 constant TARGET = 1000 * 10 ** 18;

    // 合约所有者
    address public owner;

    // 合约部署时间戳
    uint256 deploymentTimestamp;
    // 锁定期时长
    uint256 lockTime;

    address erc20Addr;

    // 标记生产商是否已经完成提款
    bool public getFundSuccess = false;

    // 智能合约的构造函数
    constructor(uint256 _lockTime) {
        // 在构造函数中初始化喂价对象
        // 我们这里采用sepolia testnet（sepolia测试网络），所以在初始化的时候要传入chainlink中提供的sepolia测试网络地址（在sepolia测试网络中部署的预言机地址），这样才能调用到部署在测试网络上的预言机
        // 我们要把合约部署到什么网络上，下面这个初始化就要传入对应网络的预言机部署地址
        dataFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);

        // 在合约部署的时候会调用构造函数，然后就可以初始化合约所有者为当时部署合约的地址
        owner = msg.sender;

        // msg系统变量表示的是当前这次交易
        // block系统变量表示的是当前的区块
        // block.timestamp表示当前区块的时间戳是多少
        // 记录合约部署的时间
        deploymentTimestamp = block.timestamp;
        lockTime = _lockTime;
    }


    // 收款函数
    // external可以被外部调用，但是不能在合约内部被调用
    // 如果该函数想要收取原生通证，比如如果我们在以太坊上部署智能合约，以太坊的原生通证就是ETH以太币，那么我们想要收取以太币的话就需要在该函数上加上payable关键字
    function fund() external payable {
        
        // require(condition, "") 当condition是false时，就会回退本次交易（revert），并提出相应的错误信息
        // 只有当condition是true时，才会成功执行本次交易
        require(convertEthToUsd(msg.value) >= MINIMUM_VALUE, "Send more ETH");
        // 获取当前发起这次交易的区块的时间戳，确保当前时间还在锁定期内
        require(block.timestamp < deploymentTimestamp + lockTime, "window is close");

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

    // 入参单位是wei，转换未usd
    function convertEthToUsd(uint256 ethAmount) internal view returns (uint256) {
        // 获取1ETH能兑换多少usd
        uint256 ethPrice = uint256(getChainlinkDataFeedLatestAnswer());
        // 将eth换算为usd
        // (ETH amount) * (ETH price) = (ETH value)
        // 我们传入的ethAmount单位是wei，但是预言机返回的换算并不是按照wei换算的，所以相乘的结果还要除以10^8
        return ethAmount * ethPrice / (10 ** 8);

    }

    // 转移合约所有权
    function transferOwnership(address newOwner) public onlyOwner {
        // 只能是合约所有者才能去转移合约所有权
        owner = newOwner;
    }

    // 在锁定期内，达到目标值，生产商可以提款
    // external修饰表明是一个外部函数，可以被外部调用
    // onlyOwner修改器修饰， 只有合约所有者才能提款
    function getFund() external windowClose onlyOwner {
        // this表示当前合约，address(this)能获取到当前合约的地址，进而就能获取到当前合约已经收取了多少钱
        require(convertEthToUsd(address(this).balance) /*balance的单位是wei*/ >= TARGET, "Target is not reached");

        // solidity中转账操作提供了三个函数，transfer、send和call，其中前两个就是单纯的转账，
        // 第三个call是在实现转行的同时，还能调用指定的函数，来提供更多额外的操作，只要是专场场景都可以用call实现，所以solidity官方推荐用call。当然可能一些老的项目里还会用transfer和send。
        // 1、transfer: transfer ETH and revert if tx failed   如果交易失败，就会回滚本次交易，付款方和收款方的余额都不会有变化
        // 将合约地址上的余额转移到msg.sender，注意这里因为涉及到转账，所以需要把msg.sender转换成payable
        // payable(msg.sender).transfer(address(this).balance);

        // 2、send: transfer ETH and return false if failed
        // send与transfer的区别就是send会返回一个bool变量，表示该交易是否成功
        // bool success = payable(msg.sender).send(address(this).balance);
        // require(success, "tx failed");

        // 3、call: transfer ETH with data return value of function and bool   它在转账的同时，还可以去调用一些payable函数
        bool success;
        (success, ) = payable(msg.sender).call{value: address(this).balance}(""); // 这里我们并没有调用额外的函数，所以只会返回交易是否成功的bool类型变量
        require(success, "transfer tx failed");
        
        // 转移所有钱之后，需要把fundersToAmount数组中所有用户的值都清零

        // 标记生产商已经完成提款
        getFundSuccess = true;
    }

    // 在锁定期内，没有达到目标值，投资人在锁定期以后退款
    // 应用windowClose修改器
    function refund() external windowClose {
        require(convertEthToUsd(address(this).balance) < TARGET, "Target is reached");
        // 检查一下当前调用合约的这个人之前是否有过众筹投款记录
        require(fundersToAmount[msg.sender] != 0, "there is no fund for you");

        bool success;
        // 把当时该用户投的钱退款
        (success, ) = payable(msg.sender).call{value: fundersToAmount[msg.sender]}(""); // 这里我们并没有调用额外的函数，所以只会返回交易是否成功的bool类型变量
        require(success, "transfer tx failed");
        // 清空该用户的fund金额，防止重复退款bug
        fundersToAmount[msg.sender] = 0;
    }

    // 修改用户投资余额
    function setFunderToAmount(address funder, uint256 amountToUpdate) external {
        // 只有外部erc20合约地址才能调用该函数来修改用户投资余额
        require(msg.sender == erc20Addr, "you do not have permission to call this funtion");
        fundersToAmount[funder] = amountToUpdate;
    }

    // 设置外部erc20合约地址
    // 只有当前合约拥有者才能调用该函数
    function setErc20Addr(address _erc20Addr) public onlyOwner {
        erc20Addr = _erc20Addr;
    }

    // 定义一个修改器
    // 这里使用修改器来简化代码
    // 有点类似于spring中的AOP切面
    modifier windowClose() {
        require(block.timestamp >= deploymentTimestamp + lockTime, "window is not close");
        // 表示应用该修改器的函数的逻辑。这样写相当于在应用该修改器最开始执行上面的require，然后再去执行自己的代码
        _;
    }

    // 定义一个修改器
    modifier onlyOwner() {
        require(msg.sender == owner, "this function can only be called by owner");
        // 表示应用该修改器的函数的逻辑。这样写相当于在应用该修改器最开始执行上面的require，然后再去执行自己的代码
        _;
    }
}

// File: fundme/FundTokenERC20.sol


pragma solidity ^0.8.20;

// FundMe
// 1. 让FundMe的参与者，基于 mapping 来领取相应数量的通证
// 2. 让FundMe的参与者，transfer 通证
// 3. 在使用完成以后，需要burn 通证（销毁通证）

// 引入ERC20标准合约

// 引入之前编写的众筹合约，用来获取其中的数据


contract FunfTokenERC20 is ERC20 {
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