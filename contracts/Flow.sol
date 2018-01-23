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
  
  TransportMode public mode;
  bool public reversible;
  address private owner;

  function Flow(TransportMode _mode, bool _reversible, address _owner) public {
    mode = _mode;
    reversible = _reversible;
    owner = _owner;
  }
  
}
