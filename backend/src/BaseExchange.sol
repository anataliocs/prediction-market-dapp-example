// SPDX-License-Identifier: MIT
pragma solidity <0.9.0;

import { ERC1155Holder } from "./common/ERC1155Holder.sol";
import { ReentrancyGuard } from "./common/ReentrancyGuard.sol";

abstract contract BaseExchange is ERC1155Holder, ReentrancyGuard { }
