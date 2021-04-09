// SPDX-License-Identifier: MIT

pragma solidity 0.6.10;

/** 
@dev for this we'll need open zeppelin contract (it can be a basic ERC20 
or for added functionality you can choose a preset one)
*/ 
import "@openzeppelin/contracts/presets/ERC20PresetMinterPauser.sol";

/**
from here define the name of the contract and ensure it inherits from 
ERC20 token standard that we've linked to already
*/
contract ERC20Faucet is ERC20 {
    
    /**
    in the constructor, you'll need to ensure it ALWAYS public 
    definte the name of your coin and symbol
    */
    constructor() public ERC20 ("Your Coin", "YOU") {
        
        /**
        from open zeppelin, we can now call the mint function to issue tokens.
        This is optional, but many projects choose to do that. 
       
        1e6 is basically 1 with 6 zeros (1000000) or 1 million.

        1 ether in this instance is same as saying 18 decimals.
        */
        _mint(msg.sender, 1e6 * 1 ether);
    }

    /**
    Once the basic is completed above, you don't have to have any additional 
    functions and the contract will deploy and whatever address deployed it 
    gets the minted tokens.

    To create a faucet, we do need to call the mint function again. This time 
    we will send funds to a specific person and specific amount. You can take 
    an address or leave it blank and in _mint() you can indicate msg.sender.
    */
    function mintCash(address recipient, uint256 amount) public {
        _mint(recipient, amount);
    }
    
}