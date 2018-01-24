pragma solidity ^0.4.17;

/**
 * The flow contract returns fares between a specific origin and destination
 */
contract Flow {
  
  enum TransportMode {
    Train,
    Bus,
    Ferry,
    Plane
  }
  
  uint public origin;
  uint public destination;
  uint public route;
  TransportMode public mode;
  bool public reversible;
  address private owner;

  function Flow(
    uint _origin,
    uint _destination,
    uint _route,
    TransportMode _mode, 
    bool _reversible, 
    address _owner
  ) public {
    origin = _origin;
    destination = _destination;
    route = _route;
    mode = _mode;
    reversible = _reversible;
    owner = _owner;
  }
  
}
