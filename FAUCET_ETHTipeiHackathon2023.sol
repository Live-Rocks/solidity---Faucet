// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;
import "@openzeppelin/contracts/utils/Address.sol";

contract FAUCET_ETHTipeiHackathon2023 {
    using Address for address payable;
    //limit mint times
    mapping(address => bool) public hasWithdrawn;

    receive() external payable {
        //you can deposit ETH
    }

    //Check contract balance
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    //you only can mint 1 times
    function withdrawMoney() public {
        require(
            !hasWithdrawn[msg.sender],
            "You have already claimed this reward"
        );
        hasWithdrawn[msg.sender] = true;
        address payable to = payable(msg.sender);
        require(address(this).balance >= 0.5 ether, "Insufficient balance");
        to.transfer(0.5 ether);
    }
}
