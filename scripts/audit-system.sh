#!/bin/bash
lynis audit system

rm -rf /tmp/openscap; mkdir /tmp/openscap
cd /tmp/openscap

wget https://www.debian.org/security/oval/oval-definitions-bookworm.xml.bz2 
bzip2 -d oval-definitions-bookworm.xml.bz2
OPENSCAP_RESULTS=$(oscap oval eval oval-definitions-bookworm.xml)
OPENSCAP_FAILS=$(echo "${OPENSCAP_RESULTS}" | grep "true")
OPENSCAP_FAILS_COUNT=$(echo "${OPENSCAP_FAILS}" | wc -l)

if [ "${OPENSCAP_FAILS_COUNT}" -eq 1 ]; then
    echo "OpenSCAP Audit OK"
else
    echo "OpenSCAP Audit FAILED: ${OPENSCAP_FAILS_COUNT}:"
    echo "${OPENSCAP_FAILS}"
fi