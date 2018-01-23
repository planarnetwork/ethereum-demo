const FlowRepository = artifacts.require("FlowRepository");

module.exports = function deploy(deployer) {
  deployer.deploy(FlowRepository);
}
