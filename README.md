# Basic Token Contract

This is a basic Ethereum token contract written in Solidity, a programming language used for smart contracts on the Ethereum blockchain.

## Contract Details

- **Name:** BasicToken
- **Version:** Solidity ^0.8.0
- **License:** MIT

## Contract Features

- **Name:** The name of the token.
- **Symbol:** The symbol used to represent the token.
- **Decimals:** The number of decimal places the token can be divided into.
- **Total Supply:** The total number of tokens that exist.
- **Balances:** A mapping of addresses to token balances.

## Constructor

- **Purpose:** Initializes the contract with initial values.
- **Parameters:**
  - `_name`: The name of the token.
  - `_symbol`: The symbol of the token.
  - `_decimals`: The number of decimal places for the token.
  - `_initialSupply`: The initial supply of tokens.
- **Actions:** Sets the contract's state variables such as `name`, `symbol`, `decimals`, `totalSupply`, and initializes the balance of the contract creator.

## Transfer Function

- **Purpose:** Allows users to transfer tokens to another address.
- **Parameters:**
  - `_to`: The address to which tokens will be transferred.
  - `_value`: The amount of tokens to transfer.
- **Conditions:**
  - The recipient address must not be zero.
  - The transfer value must be greater than zero.
  - The sender must have sufficient balance.
  - The transfer amount must not exceed a predefined limit (100 tokens).
- **Actions:** Deducts the transferred amount from the sender's balance and adds it to the recipient's balance. Emits a `Transfer` event.

## Additional Functions

- **assertTest:** A function to demonstrate the use of `assert`, which should fail since it checks for a false condition.
- **revertTest:** A function to demonstrate the use of `revert`, which is used to revert the transaction with a custom error message.
- **requireTest:** A function to demonstrate the use of `require`, which checks a condition and reverts the transaction with a custom error message if the condition is not met.

## Security Measures

- **Checks:** Various require statements ensure the validity of inputs and prevent common errors such as invalid recipient address, insufficient balance, and exceeding transfer limits.

This contract provides a foundation for creating and managing a basic ERC20-compatible token on the Ethereum blockchain. Users can deploy this contract and interact with it using Ethereum wallets and blockchain explorers.
