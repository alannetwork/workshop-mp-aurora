// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// CODE NOT AUDITED
// USE ONLY FOR EDUCATIONAL PURPOSE

contract TokenSwap {
    address public tokenA;          // Address of token A
    address public tokenB;          // Address of token B
    uint256 public exchangeRate;    // Exchange rate between token A and token B

    constructor(address _tokenA, address _tokenB, uint256 _exchangeRate) {
        tokenA = _tokenA;
        tokenB = _tokenB;
        exchangeRate = _exchangeRate;
    }

    function swapTokens(uint256 _amount) external {
        // Perform token transfer from the sender to the contract
        ERC20(tokenA).transferFrom(msg.sender, address(this), _amount);  // Transfer `_amount` tokens from the sender to the contract

        uint256 swappedAmount = _amount * exchangeRate;

        // Perform token transfer from the contract to the sender
        ERC20(tokenB).transfer(msg.sender, swappedAmount);  // Transfer `swappedAmount` tokens from the contract to the sender

        // Emit an event to indicate a successful token swap
        emit TokensSwapped(msg.sender, _amount, swappedAmount);
    }
