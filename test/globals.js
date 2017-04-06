var Globals = artifacts.require("./Globals.sol");

contract('Globals', function(accounts) {
  
  it("should assert true", function() {
    var globals;
      Globals.deployed().then(function(instance){
      globals = instance;
      return globals.etherUnitsTest.call();
    }).then(function(result){
      console.log("etherUnitsTest() received bool=",result);
      return globals.timeUnitsTest.call();
    }).then(function(result){
      var curTime = Math.floor((new Date().getTime())/1000);
      console.log("timeUnitsTest() = ", result.toNumber()," Local time = ",curTime);
      // Time after 1 days - Enum index for day unit = 2
      return globals.calculateFutureTime.call(1,0)
    }).then(function(result){
      // Create the date - time received in second need to be converted to millisec
      var dt = new Date(result.toNumber()*1000);
      //console.log("Current time = ",Math.floor((new Date().getTime())/1000));
      console.log("calculateFutureTime() = ",dt," Result = ", result.toNumber());
      return globals.getBlockInformation.call();
    }).then(function(result){
      console.log("block.number=",result[0].toNumber()," block.hash=",result[1]);
      console.log("Miner coinbase = ", result[2], " difficulty = ",result[3].toNumber());
      return globals.getMsgInformation.call();
    }).then(function(result){
      console.log("data = ",result[0]," sig = ",result[1]);
      console.log("sender = ",result[2]);
      return globals.throwBehavior("John Smith");
    }).then(function(result){
      // Result = txn receipt
      // console.log(result);
      return globals.lastCaller.call();
    }).then(function(result){
      console.log("lastCaller = ",result);
      return globals.callCrypto.call("ABCDE");
    }).then(function(result){
      console.log("keccak256 = ",result[0]);
      console.log("sha3      = ",result[1]);
      console.log("sha256    = ",result[2]);
      console.log("packed sha3 = ",result[3]);
      console.log("ripemd160   = ",result[4]);
    });
  });
});