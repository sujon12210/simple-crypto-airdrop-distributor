# Simple Crypto Airdrop Distributor

This repository provides a high-quality, flat-structured smart contract designed for project owners to distribute tokens to their community efficiently. It allows for "multisending," which reduces the overhead of manual individual transfers.

## Features
* **Bulk Transfer:** Send tokens to hundreds of addresses in one go.
* **Gas Efficiency:** Optimized loops to ensure minimal gas consumption per recipient.
* **Token Compatibility:** Works with any standard ERC-20 token.
* **Security:** Ownership-protected functions to ensure only the authorized distributor can trigger the airdrop.

## Getting Started
1. Deploy `Airdrop.sol`.
2. Approve the `Airdrop` contract to spend your ERC-20 tokens using the token's `approve` function.
3. Call `doAirdrop` with an array of addresses and an array of amounts.
4. The contract will automatically pull the tokens from your wallet and send them to the recipients.

## License
MIT
