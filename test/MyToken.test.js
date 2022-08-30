// test/MyToken.test.js

const { ethers, upgrades } = require('hardhat');
const hardhatConfig = require('hardhat/config')

// describe('MyToken', async accounts => {
//     const [
//         owner,
//         alice, bob, carol, dennis, erin, flyn, graham, harriet, ida,
//         defaulter_1, defaulter_2, defaulter_3, defaulter_4, whale,
//         A, B, C, D, E] = accounts;
describe('MyToken', function () {

    it('deploys', async function () {

        const accounts = await ethers.getSigners()
        const [
            owner,
            alice, bob, carol, dennis, erin, freddy, greta, harry, ida,
            A, B, C, D, E,
            whale, defaulter_1, defaulter_2, defaulter_3, defaulter_4] = accounts;

        const MyTokenV1 = await ethers.getContractFactory('MyTokenV1');
        const AdminContract = await ethers.getContractFactory('AdminContract');
        const ContractManager = await ethers.getContractFactory('ContractManager');
        const TestClone = await ethers.getContractFactory('TestClone');
        const myTokenV1 = await upgrades.deployProxy(MyTokenV1, ["BlaBla", "Bla"], { kind: 'uups' });
        const adminContract = await AdminContract.deploy();
        const contractManager = await ContractManager.deploy();
        const testClone = await TestClone.deploy();


        await adminContract.setAddresses(contractManager.address);

        // await adminContract.addNewContract(1, "KUSD TOKEN", "KUSD");

        await adminContract.addNewClone(1, myTokenV1.address, "KUSD TOKEN", "KUSD");

        const cloneInterface = await contractManager.getCloneInterface(1);

        console.log("cloneAddress: ", cloneInterface);
        console.log("factoryAddress: ", myTokenV1.address);

        // await myTokenV1.balanceOf(alice.address);
        // await testClone.mintFromClone(1, 100, alice.address);

        console.log("Balace of Alice | ORG: ", await myTokenV1.balanceOf(alice.address))
        // console.log("Balance of Alice | CLONE: ", await testClone.balanceOfClone(1, alice.address))
        console.log("Total Supply: ", (await testClone.totalSupplyOfClone(1)).toString())
    });
});