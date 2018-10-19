pragma solidity ^0.4.24;

import "./ERC223_Token.sol";

/**
 * @title Standard ERC223 token
 * @author TokenMint.io
 *
 * @dev Implementation of the basic standard token. For full specification see:
 * https://github.com/Dexaran/ERC223-token-standard
 */
contract TokenMintERC223Token is ERC223Token {

  constructor(string _name, string _symbol, uint8 _decimals, uint256 _initialAmount, address feeReceiver) public payable {
    name = _name;
    symbol = _symbol;
    decimals = _decimals;
    uint256 base = 10;
    totalSupply = _initialAmount * base**decimals;

    // set sender as owner of all tokens
    balances[msg.sender] = totalSupply;
    emit Transfer(address(0), msg.sender, totalSupply, "");

    // pay for service fee for contract deployment
    feeReceiver.transfer(msg.value);
  }
}
