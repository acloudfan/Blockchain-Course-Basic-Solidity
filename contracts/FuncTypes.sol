pragma solidity ^0.4.4;

/**
 * Demonstrates use of the function type variables
 **/
contract FuncTypes {

    bytes  private secret;

    // Reference to an internal function
    function(string memory) internal returns(uint) lengthFunctionVar;

    // Constructor
    function  FuncTypes(){
      lengthFunctionVar = actualLengthFunction;
    }

    // This method should NOT be available for calls from OUTSIDE the contract context
    function  actualLengthFunction(string memory str)  private returns (uint len){
      len = bytes(str).length;
    }

    // For demo purposes
    // Calls using the state variable reference rather than actual function
    function  indirectCall(string  data) external returns(uint len){
      len = lengthFunctionVar(data);
    }
}