pragma solidity ^0.4.4;

/**
 * Demonstrates the use of modifiers
 **/
contract Modifiers {
  
  address   public owner;
  // Minimum acceptable offer
  uint  constant  minimumAccetableOffer = 100;
  uint[]          lastBid;
  address[]       lastBidder;

  function  Modifiers(){
    owner = msg.sender;
  }

  // Restricts execution by owner only
  modifier  ownerOnly {
    if(msg.sender == owner){
      _;
    } else {
      /**throw;*Deprecated*/
      revert();
    }
  }

   modifier  minimumAcceptable(){
    if(msg.value >= minimumAccetableOffer){
     _;
    } else {
      /**throw;*Deprecated*/
      revert();
    }
  }

  // Checks if the caller is the owner
  function  checkOwnership() returns(bool) {
    return  (msg.sender == owner);
  }

  function  transferOwnership(address newOwner) ownerOnly returns(bool){
    owner = newOwner;
  }


  function  bidForOwnership() payable minimumAcceptable returns(bool)  {
    // Code the bid pushing
    return true;
  }

  // Code for testing mutiple modifiers
  uint  public testMod = 0;
  modifier mod1(){
    _;
  }

  modifier mod2(){
    _;
  }

  function  testModifiers()  mod1  mod2{
    testMod++;
  }
}
