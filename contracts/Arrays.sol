pragma solidity ^0.4.8;

contract Arrays {

  // Elementary type array in storage
  int[3]     staticIntArray = [1,2];    //Last element set to 0
  int8[]     dynamicIntArray;
  bool[]     dynamicBoolArray;

  // Byte type storage
  // Newer version of compiler requires data to be specified in hex otherwise you get a warning - Aug 8, 2017
  byte    byteType = 0x01; 

  // byte array - fixed length
  byte[120] bigArray;

  // Dynamic byte array in storage
  byte[]    byteData;
  // Fixed length byte array
  bytes8    bytes8Data;
  // Dynamic byte array
  bytes     bytesData;



  function testArrayOps() public {

    // Allocate memory for 8 elements to the dynamic bool storage array
    dynamicBoolArray = new bool[](8);

    // Allocate memory and initialize elements in the int array
    // Explicit conversion needed from uint8 to int8
    // Later versions of compiler requires the 1st element to be typecasted - August 9, 2017
    dynamicIntArray = [int8(1),2,3];

    // This is good
    uint8[] memory memoryArray;
    // Allocation with assignment not allowed for memory arrays
    // memoryArray = [1,2,3];
    memoryArray = new uint8[](8);
    // This will give a compile error - 
    // push() not available for memory array
    // memoryArray.push(1);
    // memoryArray.length=6;
    
    // This is OK
    byteData[0] = 0x08;

    // This is not allowed - its READ Only
    // bytes8Data[6] = 0;

    // This is OK
    bytesData[6] = 0x09;

    // Dynamic array - bytes - These are OK
    bytesData.length = 10;
    bytesData.push(1);


    /*** Examples of array initialization with assignment below */
    // Static storage array assignment is OK
    // Compile time size check is carried out 
    // so assignment to [1,2,3,4] will fail below
    staticIntArray = [1,2,3];


    // Static memory array
    uint[2] memory  staticMemoryArray;
    // This is  allowed - make sure the type is good
    staticMemoryArray = [uint(1),2];

    // This is allowed
    staticMemoryArray[0] = 0;
    staticMemoryArray[1] = 1;

    uint8[] memory dynamicMemoryArray;
    // Assignment of static array to dynamic NOT allowed
    // dynamicMemoryArray = [uint8(1),2];

    // But following is fine
    dynamicMemoryArray = new uint8[](2);
    dynamicMemoryArray[0] = 1;
    dynamicMemoryArray[1] = 2;

  
  }
}
