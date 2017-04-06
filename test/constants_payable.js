var ConstantsPayable = artifacts.require("./ConstantsPayable.sol");

/**
 * Execute against TestRPC or other simulators
 * These test cases executed against the actual Ethereum networks may not
 * give expected results as the transaction mining takes time and this code
 * execution is carried out within TestRPC that is almost instantaneous
 */
contract('ConstantsPayable', function(accounts) {
it("should return lastCaller=NOTSET", function() {
    var constantsPayable;
    return ConstantsPayable.deployed().then(function(instance){
      constantsPayable = instance;
      // Transaction - call the function
      return constantsPayable.setLastCaller("John Wayne");
    }).then(function(result){ 
      //console.log("Received Receipt = ", result.tx);
      assert.equal(undefined, result.tx);
      return constantsPayable.lastCaller.call();
    }).then(function(result){
      //console.log("Received caller name = ",result);
      assert.equal("NOTSET",result,"Unexpected result!!");
    });
  });

  it("should send and receive 1000 wei",function(){
    var constantsPayable;
    return ConstantsPayable.deployed().then(function(instance){
      constantsPayable = instance;
      // Send ethers to the contract - Truffle abstraction does not have a direct method
      web3.eth.sendTransaction({ from: accounts[0], to: constantsPayable.address, value: 1000 });
      return constantsPayable.getBalance.call();
    }).then(function(result){
      //console.log("Balance=", result.toNumber());
      assert.equal(1000,result.toNumber(), "send receive same amount!!");
    });
  });

  it("should transfer 1500 wei to a function and end balance=2500", function(){
    var constantsPayable;
    return ConstantsPayable.deployed().then(function(instance){
      constantsPayable = instance;
      // var data = web3.eth
      
      constantsPayable.receiveEthers("John Wayne",{value:1500, from:accounts[0]});
       return constantsPayable.getBalance.call();
    }).then(function(result){
      // console.log(result.toNumber());
      assert.equal(2500, result.toNumber(), "Balance equals 2500");
    });
  });

});

function  sendEtherToContract(){

}
