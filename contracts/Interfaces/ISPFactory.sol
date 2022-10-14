// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// import "@openzeppelin/contracts-upgradeable/token/ERC20/IERC20Upgradeable.sol";

import "./IStorage.sol";

interface ISPFactory {
    function createNewStorage(uint256 _number) external;

    function getStorage(uint256 _position) external view returns (IStorage);

    function createNewSP(address asset, address stabilityPool) external;

    function removeSP(address asset) external;

    
}
