// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import { Order } from "../libraries/OrderStructs.sol";

import { ISignatures } from "../interfaces/ISignatures.sol";

/// @title Signatures
/// @notice Maintains logic that defines the various signature types and validates them
abstract contract Signatures is ISignatures {
    constructor(address _safeFactory) { }

    /// @notice Validates the signature of an order
    /// @param orderHash - The hash of the order
    /// @param order     - The order
    function validateOrderSignature(bytes32 orderHash, Order memory order) public view override {
        if (!isValidSignature()) {
            revert InvalidSignature();
        }
    }

    /// @notice Mock implementation to verify a signature
    function isValidSignature() internal view returns (bool) {
        return true;
    }
}
