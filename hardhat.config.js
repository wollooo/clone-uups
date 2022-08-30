//  hardhat.config.js

// require('hardhat');

require('@nomiclabs/hardhat-ethers');
require('@openzeppelin/hardhat-upgrades');

const accounts = require("./hardhatAccountsList2k.js");
const accountsList = accounts.accountsList

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
    solidity: "0.8.11",
    defaultNetwork: "hardhat",
    networks: {
        hardhat: {
            accounts: accountsList,
            gas: 100000000,  // tx gas limit
            blockGasLimit: 150000000,
            gasPrice: 200000000000,
            initialBaseFeePerGas: 0,
            allowUnlimitedContractSize: true,
        }
    }
};