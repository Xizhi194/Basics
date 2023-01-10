//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract Contract {
    string public myString = "Hi There";

    function updateString(string memory _newString) public payable {
        if(msg.value == 1 ether) {
            myString = _newString;
        } else {
            payable(msg.sender).transfer(msg.value);
        }
    }

    uint public lastValueSent;
    string public lastFunctionCalled;
    
    fallback() external payable {
        lastValueSent = msg.value;
        lastFunctionCalled = "fallback";
    }
}