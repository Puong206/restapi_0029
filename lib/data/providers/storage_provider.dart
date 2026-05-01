import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageProvider {
  final _storage = const FlutterSecureStorage();
  static const _tokenKey = 'jwt_token';

  
}