pragma solidity ^0.4.4;

// Sample of a abstract contract
// ObjectOrientation contract inherits from this


contract  AbstractContract  {

  struct agentStruct {
    string   name;
    uint   commission;
  }


  agentStruct    agent;
  
  // constructor
  function  AbstractContract(string name){
    agent.name = name;
  }

  // Abstract - no body for the function
  function  calculateAgentCommission(uint16 saleAmount);

  // Get the agent information
  function  getAgentInformation() returns (string name, uint commission){
    name = agent.name;
    commission = agent.commission;
  }
}