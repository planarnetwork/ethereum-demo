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
  
  struct PassengerSet {
    uint8 numAdults;
    uint8 numChildren;
  }
  
  struct Fare {
    uint origin;
    uint destination;
    uint route;
    uint8 status;
    byte32[2] restriction;
    byte32[3] ticketType;
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
  
  function getFares(PassengerSet memory passengers) public view returns (Fare[]) {
    
  }
  
  function getAdultFare() private view returns (Fare) {
    
  }
}
