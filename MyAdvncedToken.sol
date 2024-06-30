// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract MyAdvancedToken {
    string public tokenName = "META";
    string public tokenAbbrv = "MTA";
    uint256 public totalSupply = 0;
    mapping(address => uint256) public balances;

    // Function to mint new tokens
    function mint(address _address, uint256 _value) public {
        require(_address != address(0), "Cannot mint to zero address"); // Check for zero address
        totalSupply += _value;
        balances[_address] += _value;
    }

    // Function to burn tokens
    function burn(address _address, uint256 _value) public {
        require(balances[_address] >= _value, "Insufficient balance to burn"); // Ensure sufficient balance
        totalSupply -= _value;
        balances[_address] -= _value;
    }

    // Function to transfer tokens
    function transfer(address _to, uint256 _value) public {
        address _from = msg.sender;
        require(_to != address(0), "Cannot transfer to zero address"); // Check for zero address
        require(balances[_from] >= _value, "Insufficient balance to transfer"); // Ensure sufficient balance

        balances[_from] -= _value;
        balances[_to] += _value;
    }

    // Function demonstrating use of assert
    function testAssert(uint256 _value) public pure returns (uint256) {
        assert(_value != 0); // Asserts that value is not zero
        return _value;
    }

    // Function demonstrating use of revert
    function testRevert(uint256 _value) public pure returns (uint256) {
        if (_value == 0) {
            revert("Value cannot be zero"); // Reverts transaction if value is zero
        }
        return _value;
    }
}
