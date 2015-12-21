#!/usr/bin/env bash
cat data/stanowisko_1.lvm | ./build/bin/swapper1 | ./build/bin/axles -pc -f ./build/bin/config1.cfg
