/*
Joint Savings Account
---------------------

*/

pragma solidity ^0.5.0;

// Define a new contract named `JointSavings`
contract JointSavings {
    address payable accountOne;
    address payable accountTwo;
    address public lastToWithdraw;
    uint public lasWithdrawAmount;
    uint public contractBalance;


    function withdraw(uint amount, address payable recipient) public {
        require(recipient == accountOne || recipient == accountTwo, "You don't own this account");
    require(address(this).balance >= amount, "Insufficient funds!");
    if (lastToWithdraw != recipient) {
      lastToWithdraw = recipient;
    }
    lasWithdrawAmount = amount;
    contractBalance = address(this).balance - amount;

    return msg.sender.transfer(amount);
  }

       




    function deposit() public payable {
        contractBalance = address(this).balance;
       
    }

    
    function setAccounts(address payable account1, address payable account2) public{
        accountOne = account1;
        accountTwo = account2;
    }

    
    function() external payable {
  }

}
