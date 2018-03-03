pragma solidity ^0.4.4;

/**
 * Demonstrates the use of the global variables 
 * and functions
 **/
contract Globals {

  enum  TimeUnit  {Minute, Hour, Day}

  string  public lastCaller = "not-set";
  
  // someVariable should always be > 0 otherwise its a BUG
  int    someVariable = 100;

  function  someComplexProcess(int num) public {
    // ....
    someVariable = someVariable - num;
    // some variable gets manupulated in the code

    // If value of someVariable goes below 0 then throw an exception
    assert(someVariable > 0);
  }


  // Demonstrates the use of the ether subdenominations
  function  etherUnitsTest() public pure returns(bool) {
   // True
   bool flag = (1 ether == 1000 finney);
   // True
   flag = (1 wei == 0.000000000000000001 ether);

   // True
   uint amount = 10 ether;
   flag = (amount*2 == 20000 finney);

   return flag;
  }

  // Demonstrates the use of the time units
  function  timeUnitsTest() public view returns (uint) {
    uint  tim = now;
    return tim;
  }

  /**
   * Calculates the time in future
   * Takes a number & a unit for the number e.g., 10 minute, 10 Hour
   **/
  function  calculateFutureTime(uint distance, uint units)  public view returns (uint) {
    if (units == uint(TimeUnit.Minute)) {
      return (now + distance*1 minutes);
    } else if (units == uint(TimeUnit.Hour)) {
      return (now + distance*1 hours);
    } else if (units == uint(TimeUnit.Day)) {
      return (now + distance*1 days);
    }
    return 1;
  }


  // Demonstrates the use of block object
  function  getBlockInformation() public view returns (uint number, bytes32 hash, address coinbase, uint difficulty) {
    number = block.number; // Previous block
    hash = block.blockhash(number - 1); // -1 because excluding current
    // Current block
    coinbase = block.coinbase;  
    difficulty = block.difficulty;
  }

  // Demonstrates the use of the msg object
  function getMsgInformation() public view returns (bytes data, bytes4  sig, address sender) {
    data = msg.data;
    sig = msg.sig;
    sender = msg.sender;
  }

  function  revertBehavior(string name) public returns (bool) {
    lastCaller = name;
    // In Ganache or TestRPC throw cannot be tested (there is a way but its kludgy)
    // Uncommenting this line would lead to exception related to JUMP 

    // Check if length of the string is zero
    if (bytes(name).length == 0) {
      revert();
    }

    // The above lines of code may be replaced with this
    //require(bytes(name).length > 0);
    
    return true;
  }

  function  callCrypto(string str) public pure returns (bytes32[5] dat) {
    dat[0] = keccak256(str);
    dat[1] = sha3(str);  // sha3 is deprecated
    dat[2] = sha256(str);
    // Tightly Packed example:  same as sha3("ABCDE")
    dat[3] = sha3("AB","C","DE"); // sha3 is deprecated
    dat[4] = ripemd160(str);
  }

}


