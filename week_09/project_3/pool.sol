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
        // number of players in this instance of the pool is determined by num
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

        // your code here
    }
    
    // Send in your choice $(num).
    function choice(uint8 num) public payable {
        // If they send any more or less than 1 ETH or we've already run and
        // completed the protocol, revert
        
        // your code here
    }
    
    // You can always assume at least one winner is honest
    function payWinner() public {
        uint winningTeam = uint(block.blockhash(block.number-1)) % 2;
        
        // your code here
    }
}