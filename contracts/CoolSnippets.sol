// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Snippets {
    uint256 controlSeed = 0;

    //Declare an Event
    event TestEvent(address indexed from, uint256 number);

    function fireEvent() public {
        controlSeed++;

        //Emit an event
        emit TestEvent(msg.sender, controlSeed);
    }

    modifier costs(uint256 _amount) {
        require(msg.value >= _amount, "Not enough Ether provided.");
        _;
        if (msg.value > _amount) msg.sender.transfer(msg.value - _amount);
    }
}
