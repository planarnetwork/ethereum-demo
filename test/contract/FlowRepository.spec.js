const {getStationIndex} = require("../util/Station.js");
const FlowRepository = artifacts.require("../FlowRepository.sol");
const Flow = artifacts.require("../Flow.sol");

contract("FlowRepository", ([owner, operator]) => {

  it("adds stations", async () => {
    const flowRepository = await FlowRepository.deployed();

    await Promise.all([
      flowRepository.addStation.sendTransaction("PDW"),
      flowRepository.addStation.sendTransaction("WAE"),
    ]);

    const count = await flowRepository.getStationCount.call();

    assert.equal(count, 2);

    const pdw = await flowRepository.stations.call(0);
    const wae = await flowRepository.stations.call(1);

    assert.equal(pdw, "PDW");
    assert.equal(wae, "WAE");
  });
  
  it("adds flows", async () => {
    const flowRepository = await FlowRepository.deployed();
    const stationsIndex = await getStationIndex(flowRepository);
    
    await flowRepository.addFlow.sendTransaction(stationsIndex["PDW"], stationsIndex["WAE"], 0, 0, false, operator);
    
    const [flowAddress] = await flowRepository.getFlows.call(stationsIndex["PDW"], stationsIndex["WAE"]);
    const flow = Flow.at(flowAddress);
    
    assert.equal(flow instanceof Flow, true);
  });

  it("correctly indexes reversible flows", async () => {
    const flowRepository = await FlowRepository.deployed();
    const stationsIndex = await getStationIndex(flowRepository);
    
    await flowRepository.addFlow.sendTransaction(stationsIndex["PDW"], stationsIndex["WAE"], 0, 0, true, operator);
    
    const flows = await flowRepository.getFlows.call(stationsIndex["WAE"], stationsIndex["PDW"]);
    
    assert.equal(flows.length, 1);
  });

});
