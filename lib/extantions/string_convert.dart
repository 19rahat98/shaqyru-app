import 'dart:convert';

String encryptToInt(String plainText) {
  List<int> bytes = utf8.encode(plainText);
  return base64Encode(bytes);
}

String? decryptFromInt(String? encrypted) {
  if (encrypted == null || encrypted.isEmpty) {
    return null;
  }
  List<int> bytes = base64Decode(encrypted);
  return utf8.decode(bytes);
}