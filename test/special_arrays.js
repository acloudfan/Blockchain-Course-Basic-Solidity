var SpecialArrays = artifacts.require("./SpecialArrays.sol");

contract('SpecialArrays', function(accounts) {
  it("convert should return 5", function() {
    var special_arrays;
    return SpecialArrays.deployed().then(function(inst){
      special_arrays = inst;
      // Call the conversionTest()
      return special_arrays.conversionTest.call();
    }).then(function(result){
      console.log("conversionTest() = ", result);
      // Call the getElementAt(1)
      return special_arrays.getElementAt.call(1);
    }).then(function(result){
      console.log("getElementAt() as byte = ", result);
      console.log("getElementAt() as string = ", web3.toAscii(result));
      // Check if we have received 0x62 which is ascii for character 'b'
      assert.equal(result, '0x62', "Unexpected result!!!");
    });

  });
});

