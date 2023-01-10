//SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

//  If the target address is a contract and the transfer fails, then 
// .transfer will result in an exception and .send will simply return false
// but the transaction won't fail.

contract Sender {
    receive() external payable {}

    function withdrawTransfer(address payable _to) public {
        _to.transfer(10);
    }

    function withdrawSend(address payable _to) public {
        bool sentSuccessful = _to.send(10);
    }
}

contract ReceiverNoAction {

    function balance() public view returns(uint) {
        return address(this).balance;
    }

    receive() external payable {}
}

contract ReceiverAction {
    uint public balanceReceived;

    function balance() public view returns(uint) {
        return address(this).balance;
    }

    receive() external payable {
        balanceReceived += msg.value;
    }
}

//Low-Level Calls on Address-Type Variables
// SPDX-License-Identifier: GPL-3.0
contract ContractOne {

    mapping(address => uint) public addressBalances;

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    receive() external payable {
        addressBalances[msg.sender] += msg.value;
    }
}

contract ContractTwo {

    function deposit() public payable {}

    function depositOnContractOne(address _contractOne) public { 
        (bool success, ) = _contractOne.call{value: 10, gas: 100000}("");
        require(success);
    }
}