/**
 * Skeleton code for Calculator
 * This contract is for demonstrating the use of Truffle framework.
 **/

pragma solidity ^0.4.17;

contract Calculator {

  // Result of the operation are always stored in this variable
  uint result=10;

  function Calculator() public {
    // constructor
    
  }

  // returns the result
  function getResult() public view returns (uint) {
    return result;
  }

  // result = result + num
  function addToNumber(uint num) public {
    result += num;
  }

  // result = result - num
  function substractNumber(uint num) public {
    result -= num;
  }

  // result = result * num
  function multiplyWithNumber(uint num) public {
    result *= num;
  }

  // result = result / num
  function divideByNumber(uint num) public {
    result /= num;
  }

}
