pragma solidity 0.4.24;

contract Ownable{
    address internal owner;

    constructor () public{
        owner = msg.sender;
    }

    modifier onlyOwner( ) {
     require(msg.sender == owner);
            _;
    }

    function kill() public onlyOwner(){
        selfdestruct(owner);
    }
}

