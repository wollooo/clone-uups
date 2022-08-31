// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
// import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
// import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
// import "@openzeppelin/contracts-upgradeable/proxy/ClonesUpgradeable.sol";

// import "./Interfaces/IContractManager.sol";
// import "./MyTokenV1.sol";

import "./Storage.sol";

contract StorageFactory {
    Storage[] private _storage;

    function createNewStorage(uint256 _number) external {
        Storage newStorage = new Storage();
        newStorage.store(_number);
        _storage.push(newStorage);
    }

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
