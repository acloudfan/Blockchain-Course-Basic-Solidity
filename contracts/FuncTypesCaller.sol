pragma solidity ^0.4.4;

// This is needed for getting the function signature
// You can avoid this inclusion by using the address.call
// by using funtion callAsTransaction
import "./FuncTypes.sol";

/**
 * Demonstrates how a contract calls another contract
 **/
contract FuncTypesCaller {
  
  // Function takes the address of FuncTypes & String
  function  callExternal(address funcTypesAddr, string str) external returns (uint){
      FuncTypes funcTypes = FuncTypes(funcTypesAddr);
      return funcTypes.indirectCall(str);
  }

  function  callAsTransaction(address funcTypesAddr, string str) external returns (uint){
      bool flag = funcTypesAddr.call(bytes4(sha3("indirectCall(string)")), str);
      if(!flag) /**throw;*Deprecated*/ revert();

      return 0;
  }  
}

