pragma solidity ^0.4.4;

/**
 * Demonstrates the use of string
 **/
contract String {

  string  public  some;
  bytes   public  bome;

  function String() {
    // constructor
    bome="Solidity is FUN!!!";
    // bome=bytes(some);
    some=string(bome);

    bome[0]=0x01;
  }
}

    // // Dynamic bytes array to string
    // string  data  = string(bytes_array);

    // // Fixed length bytes array to string
    // string  data  = string(bytes1_array);

    // string  data  = string(bytes32_array);


    // // String to bytes
    // bytes   data  = bytes(string_data);


