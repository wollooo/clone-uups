// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Interfaces/IContractManager.sol";
import "hardhat/console.sol";

contract ContractManager is IContractManager {
    mapping(uint256 => address) clones;
    mapping(uint256 => address) copies;

    function addClone(uint256 _cloneNumber, address _cloneAddress) external {
        clones[_cloneNumber] = _cloneAddress;
    }

    function addCopy(uint256 _copyNumber, address _copyAddress) external {
        copies[_copyNumber] = _copyAddress;
    }

    function getCloneInterface(uint256 _cloneNumber)
        external
        view
        override
        returns (IMyTokenV1)
    {
        return IMyTokenV1(clones[_cloneNumber]);
    }
}
