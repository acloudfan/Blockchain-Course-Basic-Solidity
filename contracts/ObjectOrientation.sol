pragma solidity ^0.4.4;

import "./AbstractContract.sol";
import "./UtilContract.sol";

// Demonstrates Solidity's support for object orientation
contract ObjectOrientation is AbstractContract, UtilContract {

  uint8   commissionRate;


  // Constructor invokes the constructor of the base class
  function ObjectOrientation(string agentName, uint8 rate) public AbstractContract(agentName) {
    commissionRate = rate;
  }

  // This function has to be implemented otherwise this contract will be abstract
  function  calculateAgentCommission(uint16 saleAmount) public {
    // The commissionRate is in percentage
    agent.commission = ((100 + commissionRate)*saleAmount)/100;
  }

  // OVERLOADING - following two functions have the same name
  function  getOwnerInfo() public returns (string name, uint8 age) {
    /** ignore warnings - they are due to unused vars & args */
  }
  
  function  getOwnerInfo(uint8 greaterThan) public  returns (string name, uint8 age) {
     /** ignore warnings - they are due to unused vars & args */
  }


}
