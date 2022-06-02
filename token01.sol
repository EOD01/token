// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

import {AccessControl} from "@openzeppelin/contracts/access/AccessControl.sol";
import {Address} from "@openzeppelin/contracts/utils/Address.sol";
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract token01 is ERC20, AccessControl {

    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    bytes32 public constant BURNER_ROLE = keccak256("BURNER_ROLE");

    constructor() ERC20("token01", "TOK01") {
        _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
    }

    modifier validDestination(address to) {
        require(!Address.isContract(to), "Cannot send to a contract!");
        _;
    }

    function mint(address to, uint256 amount)
        public onlyRole(MINTER_ROLE) validDestination(to)
    {
        _mint(to, amount);
    }

    function burn(address from, uint256 amount)
        public onlyRole(BURNER_ROLE)
    {
        _burn(from, amount);
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal virtual override validDestination(to)
    {
        super._beforeTokenTransfer(from, to, amount);
    }

}
