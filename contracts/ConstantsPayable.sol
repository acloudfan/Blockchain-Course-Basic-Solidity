pragma solidity ^0.4.4;

contract ConstantsPayable {

  // MUST initialize storage here
  uint    public  creationTime ;
  string  public  lastCaller = "NOTSET";

  address public  lastSender;
  uint    public  lastReceived=0;

  // This function will NOT update the lastCaller 
  // variable's value as it is marked constant
  function  setLastCaller(string name) constant {
    lastCaller = name;
  }

  function   ConstantsPayable() {
    // Storage constant initialization NOT allowed
    // in constructor
    creationTime = now;
  }


  // This function can receive ethers
  function receiveEthers(string name)   payable   {
    lastSender = msg.sender;
    lastReceived = msg.value;
    lastCaller = name;
  }

  function  getBalance() returns (uint){
    return this.balance;
  }

  // Fallback function
  // This function gets invoked when contract receives ethers
  // without the function data. 
  function() payable  {
    // Max gas that can be spent in this function is 2300
    // msg.value has the number wei received
    // msg.sender has the address of the sender

    // As a BEST practice just log an Event here

    // If you do not want to receive ethers in the contract
    // then throw exception here
  }
}
