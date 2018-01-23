const FlowRepository = artifacts.require("../FlowRepository.sol");

contract("FlowRepository", ([owner]) => {

  it("adds stations", async () => {
    const flowRepository = await FlowRepository.deployed();

    await flowRepository.addStation.sendTransaction("PDW");

    const count = await flowRepository.getStationCount.call();
    const station = await flowRepository.stations.call(count - 1);

    assert.equal(station, "PDW");
  });
  
});
