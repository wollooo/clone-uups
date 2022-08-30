// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ITestClone {
    // function mintFromClone(
    //     uint256 _cloneNumber,
    //     uint256 _amount,
    //     address _recipient
    // ) external;

    function balanceOfClone(uint256 _cloneNumber, address _account)
        external
        view
        returns (uint256);
}
