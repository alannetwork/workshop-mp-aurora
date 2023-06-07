// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// CODE NOT AUDITED
// USE ONLY FOR EDUCATIONAL PURPOSE

contract TokenSale {
    address public token;          // Address of the token being sold
    uint256 public tokenPrice;     // Price of each token

    constructor(address _token, uint256 _tokenPrice) {
        token = _token;
        tokenPrice = _tokenPrice;
    }

    function buyTokens(uint256 _amount) external payable {
        uint256 totalPrice = _amount * tokenPrice;
        require(msg.value >= totalPrice, "Insufficient payment");

        // Perform token transfer to the buyer
        ERC20(token).transfer(msg.sender, _amount);  // Transfer `_amount` tokens to the buyer's address

        // Emit an event to indicate a successful purchase
        emit TokensPurchased(msg.sender, _amount, totalPrice);
    }

    event TokensPurchased(address indexed buyer, uint256 amount, uint256 totalPrice);
}