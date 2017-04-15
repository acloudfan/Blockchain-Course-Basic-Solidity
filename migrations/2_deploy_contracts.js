var ConvertLib = artifacts.require("./ConvertLib.sol");
var MetaCoin = artifacts.require("./MetaCoin.sol");
var Calculator = artifacts.require("./Calculator.sol");
var String = artifacts.require("./String.sol");
var SpecialArrays = artifacts.require("./SpecialArrays.sol");
var Funcs = artifacts.require("./Funcs.sol");
var MappingEnumStruct = artifacts.require("./MappingEnumStruct.sol");
var FuncTypes = artifacts.require("./FuncTypes.sol");
var FuncTypesCaller = artifacts.require("./FuncTypesCaller.sol");
var Globals = artifacts.require("./Globals.sol");
var ConstantsPayable = artifacts.require("./ConstantsPayable.sol");
var Modifiers = artifacts.require("./Modifiers.sol");
var Events = artifacts.require("./Events.sol");

module.exports = function(deployer) {
  deployer.deploy(ConvertLib);
  deployer.link(ConvertLib, MetaCoin);
  deployer.deploy(MetaCoin);
  deployer.deploy(Calculator);
  deployer.deploy(String);
  deployer.deploy(SpecialArrays);
  deployer.deploy(MappingEnumStruct);

  // Provide the constructor parameters
  // string name, uint8 age
  deployer.deploy(Funcs,"Nelson",31);

  deployer.deploy(FuncTypes);
  deployer.deploy(FuncTypesCaller);
  
  deployer.deploy(Globals);
  deployer.deploy(ConstantsPayable);

  deployer.deploy(Modifiers);
  deployer.deploy(Events);
};
