pragma solidity ^0.4.17;

// Sample of a abstract contract
// ObjectOrientation contract inherits from this


contract  AbstractContract {

  struct AgentStruct {
    string   name;
    uint     commission;
  }


  AgentStruct    agent;
  
  // constructor
  function  AbstractContract(string name) public {
    agent.name = name;
  }

  // Abstract - no body for the function
  function  calculateAgentCommission(uint16 saleAmount) public;

  // Get the agent information
  function  getAgentInformation() public view returns (string name, uint commission) {
    name = agent.name;
    commission = agent.commission;
  }
}