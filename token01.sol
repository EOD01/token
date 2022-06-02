// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract token01 is ERC20 {

    constructor(uint256 initialSupply) ERC20("token01", "TOK01") {
        _mint(msg.sender, initialSupply);
    }

}
