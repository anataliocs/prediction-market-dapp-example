// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import { Script } from "forge-std/Script.sol";
import { Exchange } from "../src/Exchange.sol";

/// @title ExchangeDeployment
/// @notice Script to deploy the Exchange
contract ExchangeDeployment is Script {
    /// @notice Deploys the Exchange contract
    /// @param admin        - The admin for the Exchange
    /// @param collateral   - The collateral token address
    /// @param ctf          - The CTF address
    /// @param safeFactory  - The Polymarket Gnosis Safe factory address
    function deployExchange(address admin, address collateral, address ctf,  address safeFactory)
        public
        returns (address exchange)
    {
        vm.startBroadcast();

        Exchange exch = new Exchange(collateral, ctf, safeFactory);

        // Grant Auth privileges to the Admin address
        exch.addAdmin(admin);

        exchange = address(exch);
    }
}
