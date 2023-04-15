// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;
import "./OpenZeppelinERC721.sol";
import "./base64.sol";

contract JointGuaranteeNFT is ERC721URIStorage {

    // legal specialist address.
    // address councilDAOMember = 0x0BBE4d6117BB628798BCbec02c1bbbDCd6d5449f; //TBD : this should be list in the future.

    //developper address
    address councilDAOMember = 0x06baa3B6517bE5bcA66a27c9f9e6aA1dD674Eba2; //TBD : this should be list in the future.
    mapping(uint => bool ) councilVotingStatus; //TBD: need to be multi vote.
    uint nftid = 1;
    
    string tokenURIMessage = string(abi.encodePacked('data:application/json;base64,',Base64.encode(bytes(abi.encodePacked(
        // '{"name":"HyperTest NFT"',
        '{"name":"Trustfer Damage Compensation SBT","image":"data:image/svg+xml;base64,', getSVGImage(1) , 
        '"}'
        // '}'
        ))))); ///TBD: need to be set 

    function evaluateCoSigningAgreementStatus(uint trustferNFTID ) public view returns (bool){
        return councilVotingStatus[trustferNFTID];
    }

    function executeCompensation(address realassetowner, uint nftid , uint value) public {
        require(msg.sender == councilDAOMember , "not in council");
        require( councilVotingStatus[nftid], "not judged nft");
        payable(realassetowner).transfer(value * 1 ether); //TBD: need to be variable.
        _burn(nftid);
    }

    function setVoting(uint trustferNFTID) public { //TBD: need to be list
        require(msg.sender == councilDAOMember);
        councilVotingStatus[trustferNFTID] = true;
    }

    function finishCompensation(uint trustferNFTID) public {
        require(msg.sender == ownerOf(trustferNFTID));
        _burn(trustferNFTID);
        payable(msg.sender).transfer(0.9 ether);
    }

    function newCompensationNFT() public payable {
        require(msg.value == 1 ether);
        _mint(msg.sender , nftid);
        _setTokenURI(nftid,tokenURIMessage); //TBD: need to set variable image.
        nftid++;
    }

    function checkTokenGraphScore(address user) public view returns (uint) {
        return 80;
    }

    function getCompensantionValue(uint nftid) public pure returns (string memory){
        //TBD: change Value per NFT.
        return "10";
    }

    function depositDEV() public payable {}

    function getSVGImage(uint nftId) public pure returns(string memory){
        return Base64.encode(bytes(string(abi.encodePacked('<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 200" width="200" height="200"><rect width="100%" height="100%" fill="transparent"/><circle cx="50%" cy="50%" r="90" stroke="#0D5BFF" stroke-width="5" fill="none"/><text x="50%" y="50%" font-size="40" text-anchor="middle" dy=".3em" fill="#0D5BFF" font-family="Arial" font-weight="bold">',getCompensantionValue(nftId),'ETH</text><circle cx="50%" cy="50%" r="95" stroke="#0D5BFF" stroke-width="1" fill="none"/><circle cx="50%" cy="50%" r="85" stroke="#0D5BFF" stroke-width="1" fill="none"/><text x="50%" y="35%" font-size="12" text-anchor="middle" dy=".3em" fill="#0D5BFF" font-family="Arial" font-weight="bold">Eligible for</text><text x="50%" y="65%" font-size="12" text-anchor="middle" dy=".3em" fill="#0D5BFF" font-family="Arial" font-weight="bold">Damage</text><text x="50%" y="75%" font-size="12" text-anchor="middle" dy=".3em" fill="#0D5BFF" font-family="Arial" font-weight="bold">Compensation</text></svg>'))));
    }

    function addCouncilDAOMember(address newmember) public {
        require(msg.sender == councilDAOMember);
        // councilDAOMember.push(newmember); // TBD: need to be list.
    }

    constructor() ERC721("trustfer","TRUSTFERNFT") {
        //councilMember.push(0x0BBE4d6117BB628798BCbec02c1bbbDCd6d5449f);
    }

}

