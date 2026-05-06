#!/usr/bin/env bash
# Test for sample DES encryption
set -euo pipefail

# Compile
make

# Run with sample plaintext and key
# Plaintext: 123456789ABCDEF1
# Key: 133457799BBCDFF1
echo "Running DES sample test..."
./des encrypt 123456789ABCDEF1 133457799BBCDF1

echo "Sample test completed. Check the output above."
