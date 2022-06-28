// PUFF CONTRACT VOL 2 //
// Description: A simple smart contract made for the PufftheParrot NFT project. Will require a team of developers for this process //


pragma solidity =0.8.1;

contract Puff {

    struct Kid {
        uint amount;
        uint maturity;
        bool paid;


    }
    mapping(address => Kid) public amounts;  
    address public admin;

    constructor() {
        admin = msg.sender;
    
    }

// FUNCTION - ADD KID //
// Description: Allows users to add a wallet. Only the kid account can withdrawl not the admin. //

    function addKid(address kid, uint timetoMaturity) external payable {
        require(msg.sender == admin, 'only admin');
        require(kids[msg.sender].amounts == 0, 'only kid can withdraw');
        kids[kid] = Kid(msg.value, block.timestamp + timetoMaturity, false);


    }

    }

// FUNCTION - WITHDRAWL //
// Description: Allows for wallet withdrawls //


function withdrawl(external) {

Kid storage kid = kids[msg.sender];

    require(kid.maturity <= block.timestamp, 'too early');
    require(kid.amount > 0, 'only kid can withdrawl');
    require(kid.paid == false, 'paid already');
    kid.paid = true;
    payable(msg.sender).transfer(kid.amount);

}