// This script was adapted from the Crowdbotics tutorial
// Link to tutorial: https://medium.com/crowdbotics/how-to-build-a-simple-capped-crowdsale-token-using-openzeppelin-library-part-1-2789ec642308

pragma solidity ^0.4.25;

/**
 * @author Michael Narine
 */

import "../node_modules/openzeppelin-solidity/contracts/crowdsale/Crowdsale.sol";
import "../node_modules/openzeppelin-solidity/contracts/crowdsale/emission/MintedCrowdsale.sol";
import "../node_modules/openzeppelin-solidity/contracts/crowdsale/validation/CappedCrowdsale.sol";

contract CSC6890TokenCrowdsale is Crowdsale, MintedCrowdsale, CappedCrowdsale{

	//minimum investor Contribution - 5000000000000000000 => 5 ether
	uint256 public investorMinCap = 5000000000000000000;    // => 5 ether
	uint256 public investorHardCap = 50000000000000000000;  // => 50 ether

	mapping(address => uint256) public contributions;

	constructor(uint256 _rate,
	  address _wallet,
	  ERC20 _token,
	  uint256 _cap)
	Crowdsale(_rate, _wallet, _token)
	CappedCrowdsale(_cap)
	public{
	}


  function _preValidatePurchase(
    address _beneficiary,
    uint256 _weiAmount
  )
    internal
  {
    super._preValidatePurchase(_beneficiary, _weiAmount);
    uint256 _existingContribution = contributions[_beneficiary];
    uint256 _newContribution = _existingContribution.add(_weiAmount);
    require(_newContribution >= investorMinCap && _newContribution <= investorHardCap);
	contributions[_beneficiary] = _newContribution;
  }

}
