System Tests
------------

Test automation coverage for critical, customer, system-level and important component based test scenarios.


`Directory structure:`
::

    system-tests/
    ├── block
    │   ├── rbd-mirrors
    │   └── single
    ├── clusters
    ├── file-system
    ├── install
    └── object
        ├── multi-site
        └── single-site

`Execution command:`
::

    ./teuthology-suite -n 10 \
        -c <CEPH-BRANCH> \
        -s system-tests/<CEPH-COMPONENT>/<FEATURE> \
        --suite-repo <CEPH-SUITE-REPO> \
        --suite-branch <CEPH_SUITE-BRANCH> \
        --suite-relpath qa \
        -t <TEUTHOLOGY-BRANCH>  <CUSTOM YAML FILE> \
        -e <EMAIL> \
        -m <MACHINE-TYPE> \
        --distro <OS-TYPE> \
        --distro-version <OS-VERSION>

