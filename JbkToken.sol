// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract JbkToken is ERC20, Ownable {
    constructor() ERC20("JbkToken", "JBK")Ownable(msg.sender) {}

    function farmTokens(address recipient, uint256 amount) external onlyOwner {
        _mint(recipient, amount);
    }

    function destroyTokens(uint256 amount) external {
        _burn(msg.sender, amount);
    }

    function moveTokens(address recipient, uint256 amount) external returns (bool) {
        _transfer(msg.sender, recipient, amount);
        return true;
    }
}
