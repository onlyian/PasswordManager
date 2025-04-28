import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';

class EncryptionFunction {
  static final _key = encrypt.Key.fromUtf8(dotenv.env['ENCRYPTION_KEY']!); // Loaded from .env

  static String encryptText(String plainText) {
    final iv = encrypt.IV.fromSecureRandom(16);
    final encrypter = encrypt.Encrypter(encrypt.AES(_key));

    final encrypted = encrypter.encrypt(plainText, iv: iv);

    final result = {
      'iv': iv.base64,
      'cipher': encrypted.base64,
    };

    return base64Encode(utf8.encode(jsonEncode(result)));
  }

  static String decryptText(String encryptedText) {
    final decoded = jsonDecode(utf8.decode(base64Decode(encryptedText)));

    final iv = encrypt.IV.fromBase64(decoded['iv']);
    final cipher = decoded['cipher'];

    final encrypter = encrypt.Encrypter(encrypt.AES(_key));

    return encrypter.decrypt64(cipher, iv: iv);
  }
}
