# Report 1 page - Lab 4 DES / TripleDES

## Mục tiêu

Hoàn thiện implementation DES encryption/decryption, hỗ trợ multi-block với padding, và TripleDES.

## Cách làm / Method

Bổ sung hàm decrypt bằng cách dùng round keys theo thứ tự ngược lại.
Thêm xử lý multi-block trong encrypt/decrypt.
Thêm TripleDES với 3 keys: E(K1, D(K2, E(K3, pt))).
Chuyển đổi input/output giữa hex và binary.
Viết tests cho các trường hợp.

## Kết quả / Result

Chương trình chạy được encrypt/decrypt DES và TripleDES.
Tests pass: round-trip, multi-block, tamper detection, wrong key detection.
Ví dụ: encrypt 123456789ABCDEF1 với key 133457799BBCDF1 cho ciphertext hex.

## Kết luận / Conclusion

Học được DES algorithm, key scheduling, Feistel network.
Hạn chế: zero padding không an toàn, ECB mode không bảo mật.
Mở rộng: thêm CBC mode, PKCS7 padding, decryption cho TripleDES.
