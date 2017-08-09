pragma solidity ^0.4.4;

/**
 * Part of a course on Blockchain
 * Shows how events are used by contracts
 **/
contract Events {

  // Represents the time when the bidding will end
  uint    biddingEnds = now + 5 days;
  
  struct HighBidder {
    address   bidder;
    string    name;
    uint      bid;
  }

  HighBidder  highBidder;

  // Events emitted by contract
  // Whenever a high bid is received
  event NewHighBid(address indexed who, string name, uint howmuch);
  // High bid preceded by this event
  event BidFailed(address indexed who, string name, uint howmuch);

  // Ensures that bid can be received i.e, auction not ended
  modifier timed {
    if(now < biddingEnds){
      _;
    } else {
      /**throw;*  Throw deprecated */
      revert();
    }
  }

  

  function Events() {
    // Starts the bidding at 1000 wei
    highBidder.bid = 1000;
  }

  function  bid(string name) payable timed {
    // Bids allowed in increments of 10 wei
    if(msg.value > (highBidder.bid + 10)){
      // Return the loser's bid
      returnBidToLoser();
      // Make the caller the highBidder
      highBidder.bidder = msg.sender;
      highBidder.name = name;
      highBidder.bid = msg.value;
      // Received a high bid - emit event
      NewHighBid(msg.sender, name, msg.value);
    } else {
      // Received bid less than high bid emit event
      BidFailed(msg.sender, name, msg.value);
      // throw would return the ethers
      /**throw;* Deprecated*/ 
      revert();
    }
  }

  function  getHighBidder() returns(string name){
    name = highBidder.name;
  }

  // Make sure this function is private
  function   returnBidToLoser() private{
    // Here the weis are returned to the address of the loser
    // To be coded
  }

}
