# Project 3: Ethereum Smart Contracts

## Due Date

This project is due on *Friday, April 20th at 11:59:59PM*. The late deadline is *Monday, April 23rd at 11:59:59PM* for 15% penalty.

## Overview

In this project, you'll get to create your own Ethereum smart contract — not a simplification, a real contract that can be deployed on Ethereum's network! You'll get to:
- manage participants in the contract
- recieve and allocate ether via functions in your contract
  
For this project, you will get to choose between two options:

### Option 1

You will be implementing a simple sports betting pool. In a pool system, users enter by making a deposit and picking a team (in this case, the "team" they will be picking is either 0 or 1). Once all bets have been placed, the winning team will be determined randomly (see the code skeleton for more details on this). If the winning team is 0, then the betting pool should be split amongst every **honest** participant that picked 0, and vice versa if team 1 wins. The pool is first come first serve. Players are required to submit their choice of the winning team along with a deposit of 1 ETH. If a player tries to submit two choices (i.e., change their bet at any point) or pick a team that is not 0 or 1, then their second deposit should be sent back to them and they should be marked as malicious and not allowed to collect money even if they are one of the winners. If a malicious player is on the winning team, the total deposits should just be distributed among the honest winners. If a malicious player is on the losing team, they can be ignored because they would not have won any money anyway.

You will be responsible for implementing a file called `pool.sol` that implements the following API:
   
```solidity
pragma solidity ^0.4.0;
contract Pool {

    struct Player {
        uint choice;
        bool sent;
    }

    // You can assume num is always >= 2
    // You can assume that at least one winner will be an honest participant
    function Pool(uint8 num) public {
        if (num < 2) {
            revert();
        }
        // Create a new Pool system. The pool is first come first serve. The
        // number of players in this instance of the pool is determined by $(num)
        // when the contract is initiated. Players are required to submit their
        // choice of the winning team along with a deposit of 1 ETH. When
        // all players have submitted their choice, the winning players are
        // automatically determined, and the deposits are then split evenly
        // among the winning player. If a player tries to submit two choices
        // (i.e., change their bet at any point), they are marked as malicious
        // and are not allowed to collect money even if they are one of the
        // winners. If a player is marked as malicious but is on the winning
        // team, the total deposits should just be distributed among the honest
        // winners. If a player is marked as malicious but is on the losing team,
        // they can be ignored because they would not have won any money anyway.

        // Initialize any class variables you need here. This function is the
        // "constructor" for your contract.
    }
    
    // Send in your choice $(num).
    function choice(uint8 num) public payable {
        // If they send any more or less than 1 ETH or we've already run and
        // completed the protocol, you should revert using the "revert()" function

        // your code here
    }
    
    // You can always assume at least one winner is honest
    function payWinner() public {
        // Assigning the winningTeam in this way is actually pseudorandom, and
        // achieving true randomness in Ethereum smart contracts is actually a
        // non-trivial problem, so we will leave it like this for the sake of
        // the project. Since you will be testing this in an IDE such as remix,
        // this value will actually come out to the same thing every time, which
        // will come in handy for developing and debugging your contract.
        uint winningTeam = uint(block.blockhash(block.number-1)) % 2;
        
        // your code here
    }
}
```

### Option 2

Your second option is to get creative and create your own smart contract! We encourage you to do this, because if we get enough original contracts, we can look into setting up a testnet for you all to play around with each other's contracts! If you choose to implement your own smart contract, you must first get approval from Neil and I. In order to get permission, send an email to both of us outlining the purpose of your contract and how it will satisfy the the following constraints:

- Must be able to handle a variable amount of people
- Must have at least one payable function
- Must award a payout to one or more participants
- Must punish any dishonest participants in the contract
- Must disallow new participants after the contract is over/finished

**When you turn in your solidity file, you must provide a written description of what your contract does, and how it should run (i.e., if I want to participate in your contract, how am I supposed to call functions, what should be the expected behavior, how are malicious participants handled, etc.). You will not get credit if you forget to include the write-up and we cannot figure out how your contract is supposed to run.**

## Setting Up

Before starting this codelab, run `git pull` in your terminal in the `389Cspring18` directory to update your local copy of the class repository. This will pull in the project_3 folder, which has the file you need to complete the project.

If you have not already cloned the class repository, run `git clone https://github.com/UMD-CS-STICs/389Cspring18.git`. This will automatically pull in the most up-to-date files.

### IDE Instructions

While you are allowed to use whatever text editor you'd like to complete this project (Sublime, Atom, Emacs, etc.), we **strongly** recommend you use Ethereum's Remix IDE, which can be found at [remix.ethereum.org](http://remix.ethereum.org/). This IDE includes a compiler and debugger, which will be super useful for writing your contract correctly. Just copy the code from the solidity file we provided and paste it in the editor and go. You can create a new file, or just replace the code in the default file (ballot.sol). It is not a requirement of solidity to name your contract the same thing as the file, although in the real world it is good practice. 

**Please remember to copy your code regularly into a local file on your computer. If your browser crashes or you close your tab on accident and your cookie is not saved for some reason, all of your code will be gone when you revisit remix.etherem.org.**

## Submission

When you are finished, submit a zip file to the submit server containing **only** `pool.sol` or your custom contract if you chose option 2.
