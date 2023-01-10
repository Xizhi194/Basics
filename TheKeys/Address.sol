//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract Address {

    address public Address;
 
    constructor(address _Address) {
        Address = _Address;
    }

    function setSomeAddress(address _Address) public {
        Address = _Address;
    }

    function getAddressBalance() public view returns(uint) {
        return  Address.balance;
    }

    function setMyAddressToMsgSender() public {
        myAddress = msg.sender;
    }

}