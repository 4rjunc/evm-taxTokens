// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TaxToken is ERC20 {
   address public immutable fund;

    constructor(address fund_) ERC20("SimpleTax", "STX") {
        _mint(msg.sender, 1000 * 10 ** decimals());
        fund = fund_;
    }

    function _transfer(
        address sender,
        address recipient,
        uint256 amount
    ) internal virtual override {
        uint tax = (amount / 100) * 5; // 5% tax

        super._transfer(sender, recipient, amount - tax);
        super._transfer(sender, fund, tax);
    }}
