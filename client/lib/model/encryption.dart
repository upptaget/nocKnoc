import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:crypto/src/digest_sink.dart';

class Encryption {



  encrypt(value) {
    var key = utf8.encode(value);
    var bytes = utf8.encode('foobar');
    var hmacSha256 = new Hmac(sha256, key); // HMAC-SHA256
    var digest = hmacSha256.convert(bytes);

    return digest;
  }
}

Encryption encryption = new Encryption();
