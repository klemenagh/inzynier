#!/usr/bin/env bash
DIR=$(mktemp -d)
echo "Obserwuję ścieżkę ${DIR} i rozszerzenie lvm"

./build/bin/watcher ${DIR} | ./build/bin/swapper1 | ./build/bin/axles -p -f ./build/bin/config1.cfg | ./build/bin/axles_gui
