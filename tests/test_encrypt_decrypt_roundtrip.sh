#!/usr/bin/env bash
# Test round-trip encrypt -> decrypt
set -euo pipefail

# Compile
make

plaintext="123456789ABCDEF1"
key="133457799BBCDF1"

echo "Testing round-trip encryption/decryption..."

# Encrypt
ciphertext=$(./des encrypt $plaintext $key)
echo "Ciphertext: $ciphertext"

# Decrypt
decrypted=$(./des decrypt $ciphertext $key)
echo "Decrypted: $decrypted"

# Check if matches original (padded if necessary)
if [ "$decrypted" == "$plaintext" ]; then
    echo "Round-trip test PASSED"
else
    echo "Round-trip test FAILED"
    exit 1
fi
