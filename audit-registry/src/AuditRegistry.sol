// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

struct AuditRecord {
    address report; // address of audit report (e.g. on IPFS)
    uint256 timestamp; // timestamp of audit registration
    address auditor; // owner of audit record
}

contract AuditRegistry {
    // mapping from project ID to audit record
    mapping(bytes32 => AuditRecord) private audits;

    // register audit report address for project with ID
    function register(bytes32 id, address audit_address) public onlyFromAuditor(id) {
        if (is_audited(id)) {
            audits[id].report = audit_address;
            audits[id].timestamp = block.timestamp;
        } else {
            audits[id] = AuditRecord({report: audit_address, timestamp: block.timestamp, auditor: msg.sender});
        }
    }

    // check if audit report exists for project with ID
    function is_audited(bytes32 id) public view returns (bool) {
        return audits[id].report != address(0);
    }

    // generate ID from URL, e.g. GitHub
    function generate_id(string calldata url) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(url));
    }

    // generate ID from address of contract
    function generate_id(address contract_address) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(contract_address));
    }

    // modifier to check that if audit report exists, it was created by the sender
    modifier onlyFromAuditor(bytes32 id) {
        require((!is_audited(id)) || (msg.sender == audits[id].auditor), "not from audit report creator");
        _;
    }
}
