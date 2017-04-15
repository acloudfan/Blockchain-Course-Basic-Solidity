var Calculator = artifacts.require("./Calculator.sol");

contract('Calculator', function(accounts) {


  it("should assert true", function() {
    var calculator;
    return Calculator.deployed().then(function(instance){
      calculator = instance;
      // Multiply by 10 
      return calculator.multiplyWithNumber(10)
    }).then(function () {
      return calculator.getResult.call();
    }).then(function (result) {
      // Check if the result = 100
      // console.log(result)
      assert.equal(result.toNumber(), 100, "Result after multiplying with 10 should be 100");
      // Now divide by 5
      return calculator.divideByNumber(5)
    }).then(function () {
      return calculator.getResult.call();
    }).then(function (result) {
      assert.equal(result.toNumber(), 20, "Result after dividing with 5 should be 20");
    });
  });
});
