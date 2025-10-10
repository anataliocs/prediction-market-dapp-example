// SPDX-License-Identifier: MIT
pragma solidity <0.9.0;

import { IHashing } from "../interfaces/IHashing.sol";

import { Order, ORDER_TYPEHASH } from "../libraries/OrderStructs.sol";

abstract contract Hashing is IHashing {

    constructor(string memory name, string memory version) {
    }

    /// @notice Computes the hash for an order
    /// @param order - The order to be hashed
    function hashOrder(Order memory order) public view override returns (bytes32) {
        return keccak256(
                abi.encode(
                    ORDER_TYPEHASH,
                    order.salt,
                    order.maker,
                    order.signer,
                    order.taker,
                    order.tokenId,
                    order.makerAmount,
                    order.takerAmount,
                    order.expiration,
                    order.nonce,
                    order.side
                )
            );
    }
}
