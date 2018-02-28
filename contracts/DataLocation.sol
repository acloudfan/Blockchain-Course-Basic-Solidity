pragma solidity ^0.4.4;

/**
 * THIS CODE WILL THROW Compilation Errors
 * Code for demonstrating the use of keyword memory and storage
 * 
 * PLEASE IGNORE THE Warnings:
 *     "Unused local variable" As this is demo code we are not using the variables
 *     "Function state mutability ...." .... You will learn the use of view keyword :)
 * In real code you would address the warnings
 * 
 * Keyword "public" added to functions to suppress warnings - March 2018
 **/


contract DataLocation {

  // Always in storage
  uint[]  allPoints;

  string  name;

  // These would give compilation error as here you can declare only storage vars
  //uint memory amount;
  //uint[] memory some;

  function defaultAction(uint[] args) public returns (uint[] dat) {}


  function  forcedAction(uint[] storage args) internal returns(uint[] storage dat) {}

  function testFunction(){
    // This will give error
    // uint[]  localArray;

    uint[]  memory   memoryArray;
    // By default value types are created in memory
    // But you may declare them as reference to storage
    // Changes to loalName will be reflected in the storage va name
    string storage localName = name;

    // This will give error - requires array in storage
    // forcedAction(memoryArray);

    // This is fine
    defaultAction(memoryArray);

    // Creates a reference to a storage element
    uint[] storage  pointer = allPoints;
    // This is fine caz pointer is a reference to storage array
    forcedAction(pointer);
    // This is fine too
    defaultAction(pointer);
 
  }

  // constructor
  function DataLocation() public {
    /** Does nothing in demo code**/
  }

}
