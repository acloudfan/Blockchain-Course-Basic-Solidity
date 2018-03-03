pragma solidity ^0.4.17;

/**
 * Prior to compiler version 0.4.17 the compiler does not 
 * enforce view and pure keywords
 *
 * PS: You will see a warning for this function "returnConstant()"  it has been
 * deliberately left to make a point :)
 */

contract FuncsViewPure {

  uint  someValue;
  event SomeEvent(uint x);

  // uint  someConstant = 22;

  // Example -1  Bad coding practice
  // A getter function is changing the state of the contract
  function  getSomething() public returns (uint) {
    // Changing the state of the storage
    someValue = 10;

    return someValue;
  }

  // Example-1 Fixed with 'view'
  function  getSomethingFixed() public view returns (uint) {
    // Changing the state of the storage
    // Now this line will give compiler error :)
    someValue = 10;

    return someValue;
  }


  // Example - 2 Bad coding practice
  // A function that indicates the intent to return a constant is
  // using storage var in return 
  // Compiler will enforce best practice by throwing a warning
  function  returnConstant() public returns (uint) {

    return someValue+100;
  }


  // Example-2 Fixed with 'pure'
  function  returnConstantFixed() public pure returns (uint) {
    // Now this line will give compiler error
    // return someValue+100;

    return 100;
  }


  /**
   * Restricts functions access to storage variables to READ-Only
   */
  function readViewStorage() public view returns(uint) {
    // These statements will give compiler error
    // someValue = 10;
    // SomeEvent(10);

    // This is fine - as storage variable is being read
    uint local = 10 + someValue;

    return local;
  }

  /**
   * Pure functions can niether read nor write to storage variables
   */
  function readPureStorage() public pure {
    // This statement will give compiler error as Write NOT allowed
    // someValue = 10;

    // This is fine in view but NOT in pure
    // uint local = 10 + someValue;  
  }

  function FuncsViewPure() public {
    // constructor
    someValue = 10;
  }
}
