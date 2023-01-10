//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

// child contract
contract parkingFee {
    address public from;
    uint public amount;

    constructor(address _from, uint _amount) {
        from = _from;
        amount = _amount;
    }
}

contract park {
    parkingFee public parking;

    function parked() public payable {
        parking = new parkingFee(msg.sender, msg.value);
    }
}

//struct
contract parkingFee2 {
    struct parkingFee {
        address from;
        uint amount;
    }

    parkingFee public parking;

    function parked() public payable {
        parking = parkingFee(msg.sender, msg.value);
    }
}
