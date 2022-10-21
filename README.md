# clone-uups

Steps:

- [ ] Implement mapping of addresses for clones of stabilitypool rather then array
- [ ] Test address mapping in clone-uups
- [ ] test SP in KUMO in deploymenthelpers with one asset
- [ ] get AssetinSPFun. GetStabilityPoolAddress for right stabiility pool
- [ ] mint token (asset) in wallets in deploymenthelpers
- [ ] https://github.com/kumodao/kumo-protocol/issues/205
- [ ] https://github.com/kumodao/kumo-protocol/issues/204
- [ ] depoly a stabilitypool clone as clone and check gas usage
- [ ] depoly a stabilitypool clone as child and check gas usage
- [ ] compare gas usage and check if there are any optimizations
- [ ] Discuss in Team: Decide if we want to use clone or deploy new StabilityPools


Ressources:
Factory:
- https://blog.logrocket.com/cloning-solidity-smart-contracts-factory-pattern/
- https://betterprogramming.pub/learn-solidity-the-factory-pattern-75d11c3e7d29

Upgradable Factory
- https://docs.openzeppelin.com/upgrades/2.8/creating-upgradeable-from-solidity

Clones:
- https://www.youtube.com/watch?v=3Mw-pMmJ7TA
- https://medium.com/upstate-interactive/how-to-build-a-contract-factory-that-creates-contract-clones-efcc9619be0b

PoC: https://github.com/udosson/clone-uups
