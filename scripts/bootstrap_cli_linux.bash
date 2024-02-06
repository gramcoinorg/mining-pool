#!/usr/bin/env bash
set -e

echo Downloading Gram Mining Pool CLI...
wget https://github.com/gramcoinorg/mining-pool/releases/download/miners-r1/gram-mining-pool-ubuntu-x86-64.tar.gz > /dev/null 2>&1

echo Unpacking...
tar -xvzf gram-mining-pool-ubuntu-x86-64.tar.gz > /dev/null 2>&1

echo Settings permissions...
chmod +x gram-mining-pool

echo Cleaning up...
rm gram-mining-pool-ubuntu-x86-64.tar.gz

echo -e "Done.\n\n\nUse your personal command to run CLI or run \"./gram-mining-pool --help\" to display information about parameters."
