// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// CODE NOT AUDITED
// USE ONLY FOR EDUCATIONAL PURPOSE

contract TokenVesting {
    address public token;                           // Address of the token being vested
    mapping(address => uint256) public vestingSchedule;  // Mapping to track vesting schedules

    constructor(address _token) {
        token = _token;
    }

    function setVestingSchedule(address _beneficiary, uint256 _amount, uint256 _releaseTime) external {
        require(_amount > 0, "Amount must be greater than zero");

        // Perform token transfer to the vesting contract
        // Implement the transfer logic here

        vestingSchedule[_beneficiary] = _releaseTime;
    }

    function releaseTokens() external {
        uint256 releaseTime = vestingSchedule[msg.sender];
        require(releaseTime > 0 && block.timestamp >= releaseTime, "Tokens not yet released");

        // Perform token transfer to the beneficiary
        // Implement the transfer logic here

        // Reset the release time to prevent multiple releases
        vestingSchedule[msg.sender] = 0;

        // Emit an event to indicate a successful token release
        emit TokensReleased(msg.sender);
    }

    event TokensReleased(address indexed beneficiary);
}