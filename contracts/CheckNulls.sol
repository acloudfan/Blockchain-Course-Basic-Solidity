pragma solidity ^0.4.4;

/**
 * Solidity does not have the concept of null
 * So how do you check if the variable is initialized or not?
 **/
contract CheckNulls {

  // Un initialized storage variable declarations
  // Initialized to 0s
  struct SomeStruct {
    address owner;
    string  name;
  }
  
  address     owner;
  string      name;
  bytes32     keyword;
  int[7]      staticArray;
  uint8[]     dynamicArray;
  SomeStruct  someStruct;
  mapping(uint8 => bytes32) map;
  

  // This function is simply to demonstrate how
  // 0 values are checked for various data types
  function  checkZeroValues(){
    bool  flag;
    // All of the following will set flag to true
    flag = (owner == address(0x0));
    flag = (owner == 0x0);
    // For string check its length
    flag = (bytes(name).length == 0);
    // For bytes##
    flag = (keyword == 0  ||  keyword == 0x0);
    // For dynamic arrays
    flag = (dynamicArray.length == 0);
    // For static array check depends on the element type
    flag = (staticArray[0] == 0);
    // Struct - check for some attribute of struct for 0 value
    flag = (someStruct.owner == 0x0);
    flag = (bytes(someStruct.name).length == 0);
    // mapping - all keys have 0 values i.e., all keys exist
    flag = (map[19] == 0x0);
  }

}
