// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Interfaces/IContractManager.sol";
import "hardhat/console.sol";
import "./Interfaces/ITestClone.sol";

contract TestClone is ITestClone {
    IContractManager public contractManager;

    // function mintFromClone(
    //     uint256 _cloneNumber,
    //     uint256 _amount,
    //     address _recipient
    // ) external {
    //     console.log("++++++++++++++++++++++++++");
    //     IMyTokenV1 myTokenV1Cached = contractManager.getCloneInterface(
    //         _cloneNumber
    //     );

    //     console.log("++++++++++++++++++++++++++");

    //     myTokenV1Cached.mint(_recipient, _amount);
    // }

    function balanceOfClone(uint256 _cloneNumber, address _account)
        external
        view
        returns (uint256)
    {
        console.log("+++++++++++++++++++++++++++");
        IMyTokenV1 myTokenV1Cached = contractManager.getCloneInterface(
            _cloneNumber
        );

        console.log("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");

        return myTokenV1Cached.balanceOf(_account);
    }

    function totalSupplyOfClone(uint256 _cloneNumber)
        external
        view
        returns (uint256)
    {
        IMyTokenV1 myTokenV1Cached = contractManager.getCloneInterface(
            _cloneNumber
        );

        return myTokenV1Cached.totalSupply();
    }
}
