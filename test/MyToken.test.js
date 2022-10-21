// test/MyToken.test.js

const { ethers, upgrades } = require('hardhat');
const hardhatConfig = require('hardhat/config')
const helper = require("../helper.js")

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

        let contracts = await helper.deployTesterContractsHardhat();
        let erc20Address = contracts.erc20.address;
        // // Get Contract Factories
        const Storage = await ethers.getContractFactory('Storage');
        const StorageFactory = await ethers.getContractFactory('SPFactory');
        const TestStorages = await ethers.getContractFactory('TestStorages');

        // // Deploy contracts
        const storage = await Storage.deploy();
        const storageFactory = await StorageFactory.deploy();
        const testStorages = await TestStorages.deploy();

        // // Set addresses
        await testStorages.setAddresses(storageFactory.address);



        await storage.store(10);

        // // Create new Storage Contract
        await storageFactory.createNewStorage(99);
        // Fails somehow
        // TestStorage is Error: invalid address or ENS name (argument="name", value="[object Object]", code=INVALID_ARGUMENT, version=contracts/5.7.0)

        //  Deploy new StorageContract and add its address to the asset stabilityPool mapping
        const storage1 = await Storage.deploy();
        await storageFactory.createNewSP(erc20Address, storage1.address);
        await testStorages.storeTest(0, 55);


        const STORAGES = await storageFactory.allStorages();
        console.log("All Storage Children: ", STORAGES[0]);
        console.log("Storage MOTHER: ", (await storage.getValue()).toString());
        console.log("Storage Child 1: ", (await testStorages.getValueTest(0)).toString());


    });
});


  // const MyTokenV1 = await ethers.getContractFactory('MyTokenV1');
        // const AdminContract = await ethers.getContractFactory('AdminContract');
        // const ContractManager = await ethers.getContractFactory('ContractManager');
        // const TestClone = await ethers.getContractFactory('TestClone');
        // const myTokenV1 = await upgrades.deployProxy(MyTokenV1, ["BlaBla", "Bla"], { kind: 'uups' });
        // const adminContract = await AdminContract.deploy();
        // const contractManager = await ContractManager.deploy();
        // const testClone = await TestClone.deploy();


        // await adminContract.setAddresses(contractManager.address);

        // // await adminContract.addNewContract(1, "KUSD TOKEN", "KUSD");

        // await adminContract.addNewClone(1, myTokenV1.address, "KUSD TOKEN", "KUSD");

        // const cloneInterface = await contractManager.getCloneInterface(1);

        // console.log("cloneAddress: ", cloneInterface);
        // console.log("factoryAddress: ", myTokenV1.address);

        // // await myTokenV1.balanceOf(alice.address);
        // // await testClone.mintFromClone(1, 100, alice.address);

        // console.log("Balace of Alice | ORG: ", await myTokenV1.balanceOf(alice.address))
        // // console.log("Balance of Alice | CLONE: ", await testClone.balanceOfClone(1, alice.address))
        // console.log("Total Supply: ", (await testClone.totalSupplyOfClone(1)).toString())