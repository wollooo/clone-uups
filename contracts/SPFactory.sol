// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
// import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
// import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
// import "@openzeppelin/contracts-upgradeable/proxy/ClonesUpgradeable.sol";

import "./Interfaces/ISPFactory.sol";
// import "./MyTokenV1.sol";

import "./Storage.sol";

contract SPFactory {
    Storage[] private _storage;
    mapping(address => address) stabilityFactorys;

    function createNewStorage(uint256 _number) external {
        Storage newStorage = new Storage();
        newStorage.store(_number);
        _storage.push(newStorage);
    }

    function createNewSP(address asset, address stabilityPool) external {
        // console.log("Add new SP with asset: ", asset);
        stabilityFactorys[asset] = stabilityPool;
    }

    function removeSP(address asset) external {
        delete stabilityFactorys[asset];
    }

    // function getAssetSP(address asset) external view returns (IStorageFactory) {
    //     return stabilityFactorys[asset];
    // }

    function getStorage(uint256 _position) external view returns (IStorage) {
        return _storage[_position];
    }

    function allStorages() public view returns (Storage[] memory storage_) {
        return _storage;
    }
    // function addNewContract(
    //     uint256 _cloneNumber,
    //     string memory _name,
    //     string memory _symbol
    // ) external {
    //     MyTokenV1 newToken = new MyTokenV1();
    //     newToken.initialize(_name, _symbol);
    //     contractManager.addCopy(_cloneNumber, address(newToken));
    // }
}
