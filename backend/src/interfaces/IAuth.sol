// SPDX-License-Identifier: MIT
pragma solidity <0.9.0;

interface IAuthEE {
    error NotAdmin();

    /// @notice Emitted when a new admin is added
    event NewAdmin(address indexed newAdminAddress, address indexed admin);

    /// @notice Emitted when an admin is removed
    event RemovedAdmin(address indexed removedAdmin, address indexed admin);
}

interface IAuth is IAuthEE {
    function isAdmin(address) external view returns (bool);

    function addAdmin(address) external;

    function removeAdmin(address) external;
}
