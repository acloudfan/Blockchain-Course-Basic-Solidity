pragma solidity ^0.4.17;

/**
 * Simple interface that has only 1 function declaration
 */

interface SolInterface {
  // Function declared in the interface
  function interfaceFunction()  public view returns(uint8);
}

// This contract implements the interface
contract SomeContract is SolInterface {
  // Here you can have code for the contract

  // Implementation of the interface function
  function interfaceFunction()  public view returns(uint8) {
    return 10;
  }

  function otherFunction() public pure {
    // This is not in the interface
  }
}
