//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract ViewPure {

    uint public myStorageVariable;

    function setMyStorageVariable(uint _newVar) public returns(uint) {
        myStorageVariable = _newVar;
        return _newVar;
    }

    function getMyStorageVariable() public view returns(uint) {
        return myStorageVariable;
    }

    function Add(uint a, uint b) public pure returns(uint) {
        return a+b;
    }
}