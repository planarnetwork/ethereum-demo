pragma solidity ^0.4.19;

import "./Flow.sol";

/**
 * The FlowRepository contract is responsible for creating and maintaining an index of Flow contracts
 */
contract FlowRepository {
  address private owner;
  string[] public stations;
  mapping (uint => mapping (uint => address[])) private flows;
  
  function FlowRepository() public {
    owner = msg.sender;
  }
  
  /**
   * Ensure that the method is called using the given account
   */
  modifier onlyBy(address _account) {
    require(msg.sender == _account);
    _;
  }  

  /**
   * Add the given station to the list of stations returning it's ID 
   */
  function addStation(string memory stationName) public onlyBy(owner) returns (uint) {
    stations.push(stationName);
    
    return stations.length - 1;
  }
  
  /**
   * Return number of stations
   */
  function getStationCount() public view returns (uint) {
    return stations.length;
  }

  /**
   * Create a new Flow contract and assign ownership to the flowOwner. 
   *
   * Flows are indexed by origin and destination. 
   */
  function addFlow(
    uint origin, 
    uint destination, 
    uint route,
    Flow.TransportMode mode,
    bool reversible,
    address flowOwner
  ) public onlyBy(owner) {
    address flow = new Flow(origin, destination, route, mode, reversible, flowOwner);
    
    flows[origin][destination].push(flow);
    
    if (reversible) {
      flows[destination][origin].push(flow);      
    }
  }
  
  /**
   * Returns flows between the origin and destination
   */
  function getFlows(uint origin, uint destination) public view returns (address[]) {
    return flows[origin][destination];
  }
  
}
