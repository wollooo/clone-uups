// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./IMyTokenV1.sol";

interface IContractManager {
    function addClone(uint256 _cloneNumber, address _cloneAddress) external;

    function addCopy(uint256 _copyNumber, address _copyAddress) external;

    function getCloneInterface(uint256 _cloneNumber)
        external
        view
        returns (IMyTokenV1);
}
