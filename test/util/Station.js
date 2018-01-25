
/**
 * Iterate over the stations in the given 
 */
async function getStationIndex(flowRepository) {
  const count = await flowRepository.getStationCount.call();
  const stationsIndex = {};
   
  for (let i = 0; i < count; i++) {
    stationsIndex[await flowRepository.stations.call(i)] = i;
  }
   
  return stationsIndex;
}

module.exports = {getStationIndex};
