//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract Strings {

    string public myString = "Hi There";
    bytes public myBytes = "Hi There";

    function setMyString(string memory _myString) public {
        myString = _myString;
    }

    function compareTwoStrings(string memory _myString) public view returns(bool) {
        return keccak256(abi.encodePacked(myString)) == keccak256(abi.encodePacked(_myString));
    }

    function getBytesLength() public view returns(uint) {
        return myBytes.length;
    }

}