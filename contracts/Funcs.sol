pragma solidity ^0.4.4;

contract Funcs {

  string  ownerName;
  uint8   ownerAge;

  // Constructor
  function  Funcs(string name, uint8 age){
    ownerName = name;
    ownerAge = age;
  }

  // Sets the name
  function  setOwnerInfo(string name, uint8 age){
    ownerName = name;
    ownerAge = age;
  }

  function secretFunction() private {
    // Not available outside this contract
  }

  function  getOwnerInfo() returns (string name, uint8 age){
    name = ownerName;
    age = ownerAge;
  }


  // Shows that function overloading is supported
  // Returns owner data only if age > greaterThan otherwise all 0s
  // PS: Truffle framework seem to have issues with overloaded functions
  //     Uncommenting this *may* give unexpected test results
  // function  getOwnerInfo(uint8 greaterThan) returns (string name, uint8 age){
  //   if(ownerAge > greaterThan){ 
  //     name = ownerName;
  //     age = ownerAge;
  //   }
  // }


  // Shows how multiple values are received from a function call
  function  multiReturnCaller() returns (string n,uint8 a){
    // Create a tuple
    var (name, age) = getOwnerInfo();
  }


  // Get the name
  function  getOwnerName() returns (string) {

    return ownerName;
  }

  // Get the age
  function  getOwnerAge() returns(uint8 age){
    age = ownerAge;
    //return ownerAge;
  }

}
