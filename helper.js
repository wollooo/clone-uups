require('@nomiclabs/hardhat-truffle5');
const ERC20Test = artifacts.require("./contracts/TestContracts/ERC20Test.sol")

class Helper {
    static async deployTesterContractsHardhat() {
        const testerContracts = {}
        testerContracts.erc20 = await ERC20Test.new()
        return testerContracts;
    }
    
}
module.exports = Helper