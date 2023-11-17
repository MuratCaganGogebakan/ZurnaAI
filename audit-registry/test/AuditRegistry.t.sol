// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/AuditRegistry.sol";

contract AuditRegistryTest is Test {
    AuditRegistry registry;
    bytes32 project_id;
    address audit_report_address;

    function setUp() public {
        registry = new AuditRegistry();
        project_id = registry.generate_id("https://github.com/supiket/bikcoin");
        audit_report_address = address(0x123);
    }

    function test_isAudited() public {
        assert(!registry.is_audited(project_id));
        registry.register(project_id, audit_report_address);
        assert(registry.is_audited(project_id));
    }

    function test_register() public {
        registry.register(project_id, audit_report_address);
        address new_audit_report_address = address(0x1327);
        registry.register(project_id, new_audit_report_address);
    }

    function testFail_register() public {
        registry.register(project_id, audit_report_address);

        address new_audit_report_address = address(0x1327);

        vm.prank(address(0x11));
        vm.expectRevert("revert: not from audit report creator");
        registry.register(project_id, new_audit_report_address);
    }
}
