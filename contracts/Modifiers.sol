pragma solidity ^0.4.4;

/**
 * Demonstrates the use of modifiers
 **/
contract Modifiers {
  
  address   public owner;
  // Minimum acceptable offer
  uint  constant  minimumAccetableOffer = 100;
  uint[]    lastBid;
  address[] lastBidder

  function  Modifiers(){
    owner = msg.sender;
  }

  // Restricts execution by owner only
  modifier  ownerOnly {
    if(msg.sender == owner){
      _;
    } else {
      throw;
    }
  }

   modifier  minimumAcceptable(){
    if(msg.value >= minimumAccetableOffer){
     _;
    } else {
      throw;
    }
  }

  // Checks if the caller is the owner
  function  checkOwnership() returns(bool) {
    return  (msg.sender == owner);
  }

  function  transferOwnership(address newOwner) ownerOnly returns(bool){
    owner = newOwner;
  }

;

 

  function  bidForOwnership() payable returns(bool)  {
    // Code the bid pushing
    return true;
  }
}
