//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OrphanFundDAO {
    address payable public owner;
    mapping(address => uint) public donations;
    address[] public donors; 
    address payable public contractAddress;



    constructor()   {
        owner = payable(msg.sender);

    }


    function donate(uint _amount) public payable {
        // require(msg.value == _amount, "Incorrect amount provided");
        donations[msg.sender] += _amount;
        donors.push(msg.sender);
    }

    function transferFunds(address payable _recipient, uint _amount) public {
        require(msg.sender == owner, "Only owner can transfer funds");
        require(_amount <= address(this).balance, "Insufficient funds");
        _recipient.transfer(_amount);
    }

    function getDonation(address _donor) public view returns (uint) {
        return donations[_donor];
    }

    function getDonors() public view returns (address[] memory) {
        return donors;
    }

    function checkBalance() public view returns (uint256) {
        return address(this).balance;
    }

}
