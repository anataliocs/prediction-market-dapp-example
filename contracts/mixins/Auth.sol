// SPDX-License-Identifier: MIT
pragma solidity <0.9.0;

import { IAuth } from "../interfaces/IAuth.sol";

/// @title Auth
/// @notice Provides admin and operator roles and access control modifiers
abstract contract Auth is IAuth {
    /// @dev The set of addresses authorized as Admins
    mapping(address => uint256) public admins;

    modifier onlyAdmin() {
        if (admins[msg.sender] != 1) revert NotAdmin();
        _;
    }

    constructor() {
        admins[msg.sender] = 1;
    }

    function isAdmin(address usr) external view returns (bool) {
        return admins[usr] == 1;
    }

    /// @notice Adds a new admin
    /// Can only be called by a current admin
    /// @param admin_ - The new admin
    function addAdmin(address admin_) external onlyAdmin {
        admins[admin_] = 1;
        emit NewAdmin(admin_, msg.sender);
    }

    /// @notice Removes an existing Admin
    /// Can only be called by a current admin
    /// @param admin - The admin to be removed
    function removeAdmin(address admin) external onlyAdmin {
        admins[admin] = 0;
        emit RemovedAdmin(admin, msg.sender);
    }
}
