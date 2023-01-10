//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract TheLease {

    address payable owner;

    mapping(address => uint) public allowance;
    mapping(address => bool) public isAllowedToSend;

    mapping(address => bool) public security;
    address payable nextOwner;
    uint securityResetCount;
    uint public constant confirmationsFromSecurityForReset = 3;

    constructor() {
        owner = payable(msg.sender);
    }

    function proposeNewOwner(address payable newOwner) public {
        require(security[msg.sender], "You are no security");
        if(nextOwner != newOwner) {
            nextOwner = newOwner;
            securityResetCount = 0;
        }

        securityResetCount++;

        if(securityResetCount >= confirmationsFromSecurityForReset) {
            owner = nextOwner;
            nextOwner = payable(address(0));
        }
    }

    function setAllowance(address _from, uint _amount) public {
        require(msg.sender == owner, "You are not the owner!");
        allowance[_from] = _amount;
        isAllowedToSend[_from] = true;
    }

    function denySending(address _from) public {
        require(msg.sender == owner, "You are not the owner!");
        isAllowedToSend[_from] = false;
    }

    function transfer(address payable _to, uint _amount, bytes memory payload) public returns (bytes memory) {
        require(_amount <= address(this).balance, "Can't send more than the contract owns.");
        if(msg.sender != owner) {
            require(isAllowedToSend[msg.sender], "You are not allowed to send any transactions");
            require(allowance[msg.sender] >= _amount, "You are trying to send more than you are allowed to");
            allowance[msg.sender] -= _amount;

        }

        (bool success, bytes memory returnData) = _to.call{value: _amount}(payload);
        require(success, "Transaction failed");
        return returnData;
    }

    receive() external payable {}
}