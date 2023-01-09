//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.16;

contract FixedSizeArrays {
    // declaring a fixed-size array of type uint with 3 elements
    uint256[3] public numbers = [2, 3, 4];

    // declaring fixed-size arrays of type bytes
    bytes1 public b1;
    bytes2 public b2;
    bytes3 public b3;

    //.. up to bytes32

    // changing an element of the array at a specific index
    function setElement(uint256 index, uint256 value) public {
        numbers[index] = value;
    }

    // returning the number of elements in the array
    function getLength() public view returns (uint256) {
        return numbers.length;
    }

    // setting bytes arrays
    function setBytesArray() public {
        b1 = "a"; // => 0x61 (ASCII code of `a` in hex)
        b2 = "ab"; // => 0x6162
        b3 = "z"; // => 0x7A
        // b3[0] = 'a'; // ERROR => can not change individual bytes

        // byte is an alias for bytes1 on older code
    }
}

contract DynamicArrays {
    // dynamic array of type uint
    uint256[] public numbers;

    // returning length
    function getLength() public view returns (uint256) {
        return numbers.length;
    }

    // appending a new element
    function addElement(uint256 item) public {
        numbers.push(item);
    }

    // returning an element at an index
    function getElement(uint256 i) public view returns (uint256) {
        if (i < numbers.length) {
            return numbers[i];
        }
        return 0;
    }

    // removing the last element of the array
    function popElement() public {
        numbers.pop();
    }

    function f() public {
        // declaring a memory dynamic array
        // it's not possible to resize memory arrays (push() and pop() are not available).
        uint256[] memory y = new uint256[](3);
        y[0] = 10;
        y[1] = 20;
        y[2] = 30;
        numbers = y;
    }
}
