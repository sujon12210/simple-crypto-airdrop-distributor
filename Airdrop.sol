// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title Airdrop
 * @dev Distribute ERC20 tokens to multiple addresses in one transaction.
 */
contract Airdrop is Ownable {

    event TokensAirdropped(address indexed token, uint256 totalAddresses, uint256 totalAmount);

    constructor() Ownable(msg.sender) {}

    /**
     * @dev Function to distribute tokens to multiple recipients.
     * @param _token The address of the ERC20 token to distribute.
     * @param _recipients Array of addresses to receive tokens.
     * @param _amounts Array of amounts to be sent to each address.
     */
    function doAirdrop(
        address _token, 
        address[] calldata _recipients, 
        uint256[] calldata _amounts
    ) external onlyOwner {
        require(_recipients.length == _amounts.length, "Arrays must be the same length");
        
        IERC20 token = IERC20(_token);
        uint256 totalDistributed = 0;

        for (uint256 i = 0; i < _recipients.length; i++) {
            require(_recipients[i] != address(0), "Cannot send to zero address");
            token.transferFrom(msg.sender, _recipients[i], _amounts[i]);
            totalDistributed += _amounts[i];
        }

        emit TokensAirdropped(_token, _recipients.length, totalDistributed);
    }
}
