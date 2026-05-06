#!/usr/bin/env bash
# Test tampering with ciphertext
set -euo pipefail

# Compile
make

plaintext="123456789ABCDEF1"
key="133457799BBCDFF1"

echo "Testing tamper detection..."

# Encrypt
ciphertext=$(./des encrypt $plaintext $key)
echo "Original ciphertext: $ciphertext"

# Tamper by flipping a bit (change first char)
tampered=$(echo $ciphertext | sed 's/^./0/')
echo "Tampered ciphertext: $tampered"

# Decrypt tampered
decrypted=$(./des decrypt $tampered $key)
echo "Decrypted tampered: $decrypted"

# Should not match original
if [ "$decrypted" != "$plaintext" ]; then
    echo "Tamper test PASSED (decryption failed as expected)"
else
    echo "Tamper test FAILED (decryption succeeded unexpectedly)"
    exit 1
fi
