//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract Uint {
    uint256 public myUint; //0 - (2^256)-1

    uint8 public myUint8 = 250;

    uint8 public myUint8_EXP = 2**4; //=16, exponentiation is done with **

    int public myInt = -10; //-2^128 to +2^128-1

    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }

    function decrementUint() public {
        myUint--;
    }

    function incrementUint8() public {
        myUint8++;
    }

    function incrementInt() public {
        myInt++;
    }

    //Unchecked it will go from 0 to the 2^256 - 1.
    function decrementUintUnchecked() public {
        unchecked {
            myUint--;
        }
    }

    function decrementUint() public {
        myUint--;
    }
}