const Flow = artifacts.require("Flow");

module.exports = function deploy(deployer) {
  deployer.deploy(Flow);
}
