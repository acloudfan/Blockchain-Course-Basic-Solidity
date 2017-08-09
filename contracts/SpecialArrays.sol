pragma solidity ^0.4.4;

/**
 * Demonstrates the use of bytes byte[] and string
 **/

contract SpecialArrays {

  // Static or fixed length byte arrays
  // Both declarations will create array with 3 byte elements
  byte[3]    fixedByteArray;
  bytes3     bytes3Array;

  // Dynamic bytes arrays
  byte[]    dynamicByteArray;
  bytes     bytesArray;

  // String variable
  string    stringStorage = "abcde";

  // Converts the string to byte and sends the length of the string
  function  conversionTest() returns(string) {
    bytes   memory helloSolidity = "Hello Solidity!!!";
    string  memory converted = string(helloSolidity);
    return converted;
  }


  // Retrieves the element at specified index 
  function  getElementAt(uint index) returns(byte){
    // Convert string to bytes
    bytes  memory bytesData = bytes(stringStorage);
    // Get the element at the specified index
    byte   element = bytesData[index];

    return element;
  }


  function  testAssignment(){
    // uint8 need to be explicitly converted to byte type
    fixedByteArray = [byte(1),2,3];
    fixedByteArray[0] = 0x05;

    // Assignment NOT allowed as bytes3Array is readonly
    // bytes3Array    = [byte(1),2,3];
    // bytes3Array[0] = 1;
    
    // Dynamic Array
    // Create with new
    dynamicByteArray = new byte[](4);
    dynamicByteArray = [byte(1),2,3,4];
    dynamicByteArray[0] = 0x01;
    dynamicByteArray.length = 5;

    // Allocate 4 bytes for the dynamic bytes array
    bytesArray = new bytes(4);
    // Fails to compile
    // bytesArray = [byte(1),2,3,4];
    bytesArray[3] = 0x01;
    bytesArray.length = 5;

    // Memory bytes
    bytes memory memoryBytes;
    memoryBytes = new bytes(20);
    memoryBytes[0]='a';
    // Push will give compiler error as push() allowed for storage only
    // memoryBytes.push('c');
  }

  function stringLiterals(){
    // Storage pointer must be initialized - so following will give an error
    // string pointer;
    string memory asciiString = "abcde";  
    string memory hexString = hex"01010A";
    // This one would fail because of invalid hex value
    // string memory hexString = hex"01010";

    string memory escString = "\n";
    string memory utfHexString = '\x0101';
    string memory utfString = "\u0A0A";
    // Allocate memory for 8 characters
    string memory some = new string(8); 
    // Push for string not supporte - so this would fail
    // some.push('a');
    // Indexed access to string is not possible
    // This would give an error
    // some[0] = 'a';
  }
  

}
