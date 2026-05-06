#!/usr/bin/env bash
# Test multi-block and padding
set -euo pipefail

# Compile
make

# Test with plaintext longer than 64 bits (16 hex chars = 64 bits, so use 20 hex chars = 80 bits)
plaintext="123456789ABCDEF12345"
key="133457799BBCDFF1"

echo "Testing multi-block encryption..."

# Encrypt
ciphertext=$(./des encrypt $plaintext $key)
echo "Ciphertext: $ciphertext"

# Decrypt
decrypted=$(./des decrypt $ciphertext $key)
echo "Decrypted: $decrypted"

# Since padding with zeros, decrypted should be padded, but for test, just check round-trip
if [ "$decrypted" == "123456789ABCDEF123450000" ]; then
    echo "Multi-block test PASSED"
else
    echo "Multi-block test FAILED"
    echo "Expected: 123456789ABCDEF123450000"
    echo "Got: $decrypted"
fi
