import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/material.dart';

class EncryptViewModel extends ChangeNotifier {
  String? hasilEncrypted;
  String? hasilDecrypted;

  EncryptViewModel(BuildContext context);

  encryptAES(String asalEncrypt){
    final key = encrypt.Key.fromBase64('Gl4Ae7Zm79+hZj0JM30BSf9fVJSEbFpadP35qfuWzqM=');
    final iv = encrypt.IV.fromBase64('wKUfdvZxThjwNTobOzvKKA==');
    final encrypter = encrypt.Encrypter(encrypt.AES(key));

    final encrypted = encrypter.encrypt(asalEncrypt, iv: iv);

    hasilEncrypted = encrypted.base64.toString();

    print(encrypted.toString());
  }

  decryptAES(String asalDecrypt){
    var stringEncrypted = encrypt.Encrypted.fromBase64(asalDecrypt);
    final key = encrypt.Key.fromBase64('Gl4Ae7Zm79+hZj0JM30BSf9fVJSEbFpadP35qfuWzqM=');
    final iv = encrypt.IV.fromBase64('wKUfdvZxThjwNTobOzvKKA==');
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final decrypted = encrypter.decrypt(stringEncrypted, iv: iv);

    hasilDecrypted = decrypted.toString();
    print('hasil decrypt dari viewModel '+decrypted.toString());
  }
}