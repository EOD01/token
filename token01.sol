// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract JUB70Token is ERC20 {

    constructor(uint256 initialSupply) ERC20("Jubilee70", "JUB70") {
        _mint(msg.sender, initialSupply);
    }

}
