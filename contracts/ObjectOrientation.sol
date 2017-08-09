pragma solidity ^0.4.4;

import "./AbstractContract.sol";
import "./UtilContract.sol";

// Demonstrates Solidity's support for object orientation
contract ObjectOrientation is AbstractContract, UtilContract {

  uint8   commissionRate;

  // Constructor inokes the constructor of the base class
  function ObjectOrientation(string agentName, uint8 rate) AbstractContract(agentName) {
    commissionRate = rate;
  }

  // This function has to be implemented otherwise this contract will be abstract
  function  calculateAgentCommission(uint16 saleAmount)  {
    // The commissionRate is in percentage
    agent.commission = ((100 + commissionRate)*saleAmount)/100;
  }

  // OVERLOADING - following two functions have the same name
  function  getOwnerInfo() returns (string name, uint8 age){
  }
  
  function  getOwnerInfo(uint8 greaterThan) returns (string name, uint8 age){
  }
}
