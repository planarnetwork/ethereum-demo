const FlowRepository = artifacts.require("../FlowRepository.sol");

contract("FlowRepository", async ([owner]) => {
  const flowRepository = await FlowRepository.deployed();

  it("adds stations", async () => {
    await flowRepository.addStation.call("PDW");
    
    assert.equal(flowRepository.stations(0), "PDW");
  });
  
});
