// This test may not work against EVM as the addCaptial are invoked as txn
// MUST be mined before data will become available. Try in TestRPC only
var MappingEnumStruct = artifacts.require("./MappingEnumStruct.sol");

contract('MappingEnumStruct', function(accounts) {
  it("should return capital of Egypt & then Blank", function() {
    var mapping_enum_struct;
    return MappingEnumStruct.deployed().then(function(instance){
      mapping_enum_struct = instance;
      // Add some sample data
      mapping_enum_struct.addCapital("Egypt", "Cairo");
      mapping_enum_struct.addCapital("America", "Washington DC");
      return mapping_enum_struct.addCapital("Australia", "Sydney");
    }).then(function(){
      return mapping_enum_struct.getCapital.call("Egypt");
    }).then(function(result){
      console.log("Capital of Egypt: ", result);
      assert.isTrue(result === "Cairo");
      // remove the capital of Egypt
      mapping_enum_struct.removeCapital("Egypt");
      return mapping_enum_struct.getCapital.call("Egypt");
    }).then(function(result){
      console.log("Capital of Egypt: ", result);
      assert.isTrue(result === "");
    });
  });
});

