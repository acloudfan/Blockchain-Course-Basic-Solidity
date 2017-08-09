pragma solidity ^0.4.4;

contract BasicDataTypes {
  
  uint8   x8 = 255;   // 1 bytes unsined integer
  
  address owner;      // Address of the owner
  uint    ownerInitialBalance;

  function BasicDataTypes(address addr) {


    owner = addr;
    ownerInitialBalance = owner.balance;

    int  x256;     // 32 byte signed integer

    x256 = x8;     // Compilation successful

    //x8 = x256;        // Fails compilation as the maximum value of int256 cannot be accomodated in uint8

    x8 = uint8(x256);   // Explicit type coversion

    bool  flag = true;  // Un initialized boolean is set to False

    // if(1){ } will not compile
    if(1 > 0) {}         // This will work because expression evaluates to bool

    var deduced = x8;    // Compiler automagically assigns the type uin8 to variable deduced;
    // deduced = x256;   // This will fail to compile because deduced is set to type uin8

    uint balance = owner.balance;

    // Ignore this line - This is just make compile happy - suppress unused local var warnings - Aug 8, 2017
    if((balance+deduced) == 0 || flag ){}
  }

}
