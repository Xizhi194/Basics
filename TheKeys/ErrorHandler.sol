//SPDX-License-Identifier: MIT

pragma solidity 0.8.16;

contract Exception {

    mapping(address => uint) public balanceReceived;

    function receiveMoney() public payable {
        assert(msg.value == uint8(msg.value));
        balanceReceived[msg.sender] += uint8(msg.value);
        assert(balanceReceived[msg.sender] >= uint8(msg.value));
    }

    function withdrawMoney(address payable _to, uint _amount) public {
        require(_amount <= balanceReceived[msg.sender], "Not Enough Funds, aborting");
        assert(balanceReceived[msg.sender] >= balanceReceived[msg.sender] - _amount);
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
}

contract Error {
    function aFunction() public pure {
        require(false, "Error message");
    }
}

contract ErrorHandling {
    event ErrorLogging(string reason);
    function catchError() public {
        Error r = new Error();
        try r.aFunction() {
            //here we could do something if it works
        }  catch Error(string memory reason) {
            emit ErrorLogging(reason);
        }
    }
}
