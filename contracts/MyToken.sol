// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";

contract MyToken is ERC20Capped, Ownable {
    constructor() ERC20("MyToken", "MTK") ERC20Capped(50000000) {
        _mint(msg.sender, 30000000 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}
pragma solidity ^0.8.2;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";

contract MyToken is ERC20Capped, Ownable {
    constructor() ERC20("MyToken", "MTK") ERC20Capped(50000000 * 10 ** decimals()) {
        ERC20._mint(msg.sender, 30000000 * 10 ** decimals());
    }

    

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}


