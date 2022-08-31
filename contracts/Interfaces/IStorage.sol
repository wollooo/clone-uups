// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// import "@openzeppelin/contracts-upgradeable/token/ERC20/IERC20Upgradeable.sol";

interface IStorage {
    function store(uint256 number) external;

    function getValue() external view returns (uint256);
}
