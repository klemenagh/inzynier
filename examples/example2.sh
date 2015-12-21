#!/usr/bin/env bash
cat data/stanowisko_2.lvm | ./build/bin/swapper2 | ./build/bin/axles -p -f ./build/bin/config2.cfg
