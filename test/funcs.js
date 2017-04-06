var Funcs = artifacts.require("./Funcs.sol");

contract('Funcs', function(accounts) {

  /** Case 3, constructor */
  it("should initialize constructor correctly", function() {
    var funcs;
    return Funcs.deployed().then(function(instance){
      funcs = instance;
     return funcs.getOwnerInfo.call();
    }).then(function(result){
      // Result received as an array
      console.log("Constructor initialized Name: ",result[0]," Age: ", result[1].toNumber());
      assert.equal(result[0],"Nelson");
   });
  });

  /** Case 1, getOwnerName/getOwnerAge called */
  // it("should get the owner name/age correctly", function() {
  //   var funcs;
  //   return Funcs.deployed().then(function(instance){
  //     funcs = instance;
  //     // Set the owner name & age
  //     funcs.setOwnerInfo("David",23);
  //     return funcs.getOwnerName.call();
  //   }).then(function(result){
  //     console.log("getOwnerName() : ", result);
  //     assert.equal(result,"David","Name was expected to be David!!!");
  //     return funcs.getOwnerAge.call();
  //   }).then(function(result){
  //     console.log("getOwnerAge() : ", result.toNumber());
  //     assert.equal(result,23,"Age was expected to be 23!!!");
  //   });
  // });

  /** Case-2 calls getOwnerInfo */
  // it("should get the owner name/age correctly", function() {
  //   var funcs;
  //   return Funcs.deployed().then(function(instance){
  //     funcs = instance;
  //     // Set the owner name & age
  //     funcs.setOwnerInfo("Jarvis",42);
  //     return funcs.getOwnerInfo.call();
  //   }).then(function(result){
  //     // Result received as an array
  //     console.log("Name: ",result[0]," Age: ", result[1].toNumber());
  //     assert.equal(result[0],"Jarvis");
  //   });
  // });
});


