pragma solidity 0.4.24;

contract StorageBasic{

    uint private storedValue;

    constructor(uint initValue) public {
        storedValue = initValue;
    }


    function set(uint value) public {
        storedValue = value;
    }

    function get() public view returns(uint){
        return storedValue;
    } 
}