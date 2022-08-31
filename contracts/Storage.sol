// SPDX-License-Identifier: GPL-3.0

pragma solidity >0.7.0 <0.9.0;

/**
 * @title Storage
 * @dev store or retrieve variable value
 */

import "./Interfaces/IStorage.sol";

contract Storage is IStorage {
    uint256 value;

    function store(uint256 number) public {
        value = number;
    }

    function getValue() public view returns (uint256) {
        return value;
    }
}
