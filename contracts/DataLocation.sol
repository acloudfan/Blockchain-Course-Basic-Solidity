pragma solidity ^0.4.4;

/**
 * THIS CODE WILL THROW Compilation Errors
 * Code for demonstrating the use of keyword memory and storage
 **/

contract DataLocation {

  // Always in storage
  uint[]  allPoints;

  function  defaultAction(uint[] args) returns (uint[] dat) {
    //...code..
  }
  function  forcedAction(uint[] storage args) internal returns(uint[] storage dat) {
    //...code...
  }

  function testFunction(){
    // This will give error
    // uint[]  localArray;

    uint[]  memory   memoryArray;

    // This will give error - requires array in storage
    // forcedAction(memoryArray);

    // This is fine
    defaultAction(memoryArray);

    // Creates a refernce
    uint[]  pointer = allPoints;
    // This is fine caz pointer is a reference to storage array
    forcedAction(pointer);
    // This is fine too
    defaultAction(pointer);
 
  }

  function DataLocation() {
    // constructor
  }

}
