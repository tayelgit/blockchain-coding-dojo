pragma solidity 0.4.24;

contract Payment{

    mapping (address => bool) public paid;
    uint public fee;
    string public topic;

    constructor(uint _fee, string _topic)public{
        fee = _fee;
        topic = _topic;
    }

    function pay() public payable {
        require(fee == msg.value,"Please send the exact amount");
        paid[msg.sender] = true;
    }

    function showReceipt()public view returns (bool){
        return paid[msg.sender];
    }

}