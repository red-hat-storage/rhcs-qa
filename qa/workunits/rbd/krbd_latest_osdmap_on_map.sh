#!/bin/bash

set -ex

function run_test() {
    ceph osd pool create foo 12
    rbd pool init foo
    rbd create --size 1 foo/img

    local dev
    dev=$(sudo rbd map foo/img)
    sudo rbd unmap $dev

    ceph osd pool delete foo foo --yes-i-really-really-mean-it
}

NUM_ITER=20

for ((i = 0; i < $NUM_ITER; i++)); do
    run_test
done

rbd create --size 1 img --image-feature layering
DEV=$(sudo rbd map img)
for ((i = 0; i < $NUM_ITER; i++)); do
    run_test
done
sudo rbd unmap $DEV

echo OK
