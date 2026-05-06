#!/usr/bin/env bash
# Test decryption with wrong key
set -euo pipefail

# Compile
make

plaintext="123456789ABCDEF1"
key="133457799BBCDFF1"
wrong_key="133457799BBCDFF2"

echo "Testing wrong key decryption..."

# Encrypt with correct key
ciphertext=$(./des encrypt $plaintext $key)
echo "Ciphertext: $ciphertext"

# Decrypt with wrong key
decrypted=$(./des decrypt $ciphertext $wrong_key)
echo "Decrypted with wrong key: $decrypted"

# Should not match original
if [ "$decrypted" != "$plaintext" ]; then
    echo "Wrong key test PASSED (decryption failed as expected)"
else
    echo "Wrong key test FAILED (decryption succeeded unexpectedly)"
    exit 1
fi
