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

    function  Modifiers() public {
        owner = msg.sender;
    }

    // Restricts execution by owner only
    modifier  ownerOnly {
        if(msg.sender == owner) {
            _;
        } else {
            /** Throw an exception */
            revert();
        }
    }

    modifier  minimumAcceptable(){
        if(msg.value >= minimumAccetableOffer){
            _;
        } else {
            /** Throw an exception */
            revert();
        }
    }

    // Checks if the caller is the owner
    function  checkOwnership() public view returns(bool) {
        return  (msg.sender == owner);
    }

    function  transferOwnership(address newOwner) ownerOnly public returns(bool){
        owner = newOwner;
    }


    function  bidForOwnership() payable public minimumAcceptable returns(bool)  {
        // Code the bid pushing
        return true;
    }

    // Code for demostrating mutiple modifiers
    uint  public testMod = 0;
    modifier mod1(){
        _;
    }

    modifier mod2(){
        _;
    }

    // Demoonstrates that multiple modifiers may be applied to a function
    function  testModifiers()  mod1  mod2 public {
        testMod++;
    }
}
