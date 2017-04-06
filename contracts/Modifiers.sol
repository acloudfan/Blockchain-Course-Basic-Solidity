pragma solidity ^0.4.4;

/**
 * Demonstrates the use of modifiers
 **/
contract Modifiers {
  
  address   public owner;

  function  Modifiers(){
    owner = msg.sender;
  }

  // Restricts execution by owner only
  modifier  ownerOnly {

    return; // Function body not executed at all

    if(msg.sender == owner){
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

  // Minimum acceptable offer
  uint  constant  minimumAccetableOffer = 100;
  uint[]    lastBid;
  address[] lastBidder;

  modifier  minimumAcceptable(){
    if(msg.value >= minimumAccetableOffer){
     _;
    } else {
      throw;
    }
  }

  function  bidForOwnership() payable returns(bool)  {
    // Code the bid pushing
    return true;
  }
}
