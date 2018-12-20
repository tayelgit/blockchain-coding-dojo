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

    function whoHasPaid() public view onlyOwner() returns(address[]) {
        return hasPaid;
    }
}

contract Registry {
    mapping(address => address[]) private userContracts;
    
    function createNewBill(uint _fee, string _topic) public {
        address newBill = new Payment(_fee,_topic);
        userContracts[msg.sender].push(newBill);
    }

    function getMyBills() public view returns(address[]){
        return userContracts[msg.sender];
    }

}
