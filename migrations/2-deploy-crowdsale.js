const MyToken = artifacts.require("MyToken.sol");
const MyCrowdsale = artifacts.require("MyCrowdsale.sol");

module.exports = async function (deployer, network, accounts) {
  await deployer.deploy(MyToken, '100000000');
  const token = await MyToken.deployed();
  
  await deployer.deploy(MyCrowdsale, 400000, accounts[0], token.address);
  const crowdsale = await MyCrowdsale.deployed();

  token.transfer(crowdsale.address, await token.totalSupply())
};