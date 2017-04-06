var String = artifacts.require("./String.sol");

contract('String', function(accounts) {
  it("should assert true", function() {
    
    return String.deployed().then(function(instance) {
      fun = instance;
      // call the func
      return fun.some();
    }).then(function(result){
      console.log(result);
      return fun.bome();
    }).then(function(result){
      console.log(result);
    });
  });
  
});
