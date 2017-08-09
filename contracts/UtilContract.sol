pragma solidity ^0.4.4;

// Utilities for contracts
contract UtilContract {

  // Concatenates strings
  function  concatenate(string s1, string s2) returns(string){

    bytes memory a = bytes(s1);
    bytes memory b = bytes(s2);
    string memory concat = new string(a.length+b.length);
    bytes  memory bm = bytes(concat);
    uint k = 0;

    for (uint i = 0; i < a.length; i++) bm[k++] = a[i];
    for (i = 0; i < b.length; i++) bm[k++] = b[i];


    return string(bm);
  }
}
