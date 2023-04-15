README.md
=========

Overview
--------

JointGuaranteeNFT is a smart contract designed for rent guarantee companies. This contract evaluates whether the guarantor is capable of paying the damage compensation and provides rent guarantees by issuing a Non-Fungible Token (NFT) to the guarantor.

Features
--------

1.  Issuing new damage compensation NFTs
2.  Checking the credit score of the guarantor
3.  Getting the damage compensation amount
4.  Approving damage compensation through council voting
5.  Paying the damage compensation
6.  Adding council DAO members
7.  Generating SVG images for NFTs

Usage
-----

### 1\. Issuing new damage compensation NFTs

To issue a damage compensation NFT, call the `newCompensationNFT()` function and send 1 ETH. The issued NFT will be sent to the guarantor.

### 2\. Checking the credit score of the guarantor

To check the credit score of a guarantor, call the `checkTokenGraphScore(address user)` function. This function takes the user's address as an argument and returns the credit score.

### 3\. Getting the damage compensation amount

To get the damage compensation amount of an NFT, call the `getCompensantionValue(uint nftid)` function. This function takes the NFT's ID as an argument and returns the damage compensation amount.

### 4\. Approving damage compensation through council voting

For council members to approve damage compensation, call the `setVoting(uint trustferNFTID)` function. This function takes the NFT's ID as an argument and approves the damage compensation.

### 5\. Paying the damage compensation

After the council approves the damage compensation, call the `executeCompensation(address realassetowner, uint nftid , uint value)` function. This function takes the real asset owner's address, the NFT's ID, and the compensation amount as arguments and transfers the compensation to the real asset owner. The NFT is then burned.

### 6\. Adding council DAO members

To add a new council DAO member, call the `addCouncilDAOMember(address newmember)` function. This function takes the new member's address as an argument and adds the new member to the council DAO.

### 7\. Generating SVG images for NFTs

The `getSVGImage(uint nftId)` function generates an SVG image for an NFT. This function takes the NFT's ID as an argument and returns the SVG image encoded in base64.

Dependencies
------------

This smart contract uses the following dependencies:

*   `OpenZeppelinERC721.sol`: An implementation of the ERC721 standard from the OpenZeppelin library. This standard provides basic functionality for managing and transferring NFTs.
*   `base64.sol`: A library for encoding and decoding data in base64 format.

Constructor
-----------

The `constructor()` function initializes the ERC721 contract with a name and symbol, and sets the initial council DAO member. In future implementations, this should be a list of council DAO members.

Additional Considerations
-------------------------

1.  The current implementation uses a single council DAO member. It's recommended to update the contract to use a list of members to allow for more decentralized decision-making.
2.  The credit score checking function (`checkTokenGraphScore`) currently returns a hardcoded value of 80. This should be replaced with a function that retrieves the actual credit score from an external source or uses an on-chain mechanism.
3.  The damage compensation value is currently hardcoded in the `getCompensantionValue` function. In future implementations, this value should be variable and dependent on various factors.
4.  The SVG image generation in the `getSVGImage` function can be further customized to include additional data or visual elements.

Disclaimer
----------

This README provides general guidance on how to use the JointGuaranteeNFT smart contract. It is important to conduct a thorough audit and testing of the contract before deploying it on the mainnet. The provided information is not exhaustive, and it is the user's responsibility to ensure that the smart contract meets their specific requirements.
