var Modifiers = artifacts.require("./Modifiers.sol");

contract('Modifiers', function (accounts) {
  it("deployed with msg.sender=account[0]", function () {
    var modifiers;
      return Modifiers.deployed().then(function (instance) {
      modifiers = instance;
      return modifiers.owner.call();
    }).then(function (result) {
      // truffle uses account[0] for deployment of contract
      assert.equal(accounts[0], result);
    });
  });

  it("calling transferOwnership with account[1] should fail", function () {
    var modifiers;
      return Modifiers.deployed().then(function (instance) {
      modifiers = instance;
      // Simulate a transaction sent from accounts[1] 
      // Since accounts[1] is NOT the owner - this would fail
      // In truffle it will throw exception and terminate the script execution
      // This will throw exception
     modifiers.transferOwnership(accounts[1], {from:accounts[1]});
      // This would go OK
      // modifiers.transferOwnership(accounts[0], {from:accounts[0]});
      return modifiers.owner.call();
    }).then(function (result) {
      console.log(result)
      // owner == account[0]
      assert.equal(accounts[0], result);
    });
  });

  // Multiple modifier
  // Uncomment code below to see behavior of func with multiple modifier
  // it("should invoke multiple modifiers", function(){
  //   var modifiers;
  //     return Modifiers.deployed().then(function (instance) {
  //     modifiers = instance;
  //     // Simulate a transaction sent from accounts[1] 
  //     // Since accounts[1] is NOT the owner - this would fail
  //     // In truffle it will throw exception and terminate the script execution
  //     modifiers.testModifiers();
  //     return modifiers.testMod.call();
  //   }).then(function(result){
  //     console.log("testMod=",result.toNumber());
  //     assert.equal(1,result.toNumber());
  //   });
    
  // });
  
});
