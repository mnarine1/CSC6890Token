// This script was adapted from the Crowdbotics tutorial
// Link to tutorial: https://medium.com/crowdbotics/how-to-build-a-simple-capped-crowdsale-token-using-openzeppelin-library-part-1-2789ec642308

pragma solidity ^0.4.25;

/**
 * @author Michael Narine
 */

import "../node_modules/openzeppelin-solidity/contracts/token/ERC20/DetailedERC20.sol";
import "../node_modules/openzeppelin-solidity/contracts/token/ERC20/StandardToken.sol";

contract CSC6890Token is StandardToken, DetailedERC20 {
    constructor(string _name, string _symbol, uint8 _decimals)
        DetailedERC20(_name, _symbol, _decimals)
        public
    {
    }

   /**
    * @dev Returns the balance of the account at the specified Address
    * @param _acc Address of the account that is being checked
    */
   function getTokensLeft(address _acc) public view returns (uint256) {
      return _acc.balance;
   }
}
