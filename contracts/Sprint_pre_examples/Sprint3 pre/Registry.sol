pragma solidity 0.4.24;

contract Payment{

    mapping (address => bool) public paid;
    
    uint public fee;
    address public owner;
    string public topic;

    address[] private hasPaid;


    constructor(uint _fee, string _topic)public{
        fee = _fee;
        topic = _topic;
        owner = msg.sender;
    }

    function pay() public payable {
        require(fee == msg.value,"Please send the exact amount");
        paid[msg.sender] = true;
        hasPaid.push(msg.sender);
    }

    function whoHasPaid() public view onlyOwner() returns(address[]) {
        return hasPaid;
    }

    function showReceipt()public view returns (bool){
        return paid[msg.sender];
    }

    //Owner functions
    modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }

     function kill() public onlyOwner(){
        selfdestruct(owner);
    }

    function withdraw() public onlyOwner(){
        uint amount = address(this).balance;
        owner.transfer(amount);
    }

}

contract Registry {
    mapping(address => address[]) private userContracts;
    
    function createNewPayment(uint _fee, string _topic) public {
        address newPayment = new Payment(_fee,_topic);
        userContracts[msg.sender].push(newPayment);
    }

    function getMyPayments() public view returns(address[]){
        return userContracts[msg.sender];
    }

}
