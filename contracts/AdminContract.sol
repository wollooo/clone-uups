// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/ClonesUpgradeable.sol";

import "./Interfaces/IContractManager.sol";
import "./MyTokenV1.sol";

contract AdminContract {
    // @custom:oz-upgrades-unsafe-allow constructor

    IContractManager private contractManager;

    function setAddresses(address _contractManagerAddress) external {
        contractManager = IContractManager(_contractManagerAddress);
    }

    function addNewClone(
        uint256 _cloneNumber,
        address _contractImplementation,
        string memory _name,
        string memory _symbol
    ) external {
        address clonedContract = ClonesUpgradeable.clone(
            _contractImplementation
        );

        // MyTokenV1 myTokenV1 = MyTokenV1(clonedContract);
        // myTokenV1.initialize(_name, _symbol);
        // console.log(address(myTokenV1));
        MyTokenV1(clonedContract).initialize(_name, _symbol);

        contractManager.addClone(_cloneNumber, clonedContract);
    }

    function addNewContract(
        uint256 _cloneNumber,
        string memory _name,
        string memory _symbol
    ) external {
        MyTokenV1 newToken = new MyTokenV1();
        newToken.initialize(_name, _symbol);
        contractManager.addCopy(_cloneNumber, address(newToken));
    }
}
