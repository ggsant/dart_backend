import 'package:shelf/shelf.dart';

abstract class SecurityServiceGeneric<T> {
  Future<String> generateJwt(String userId);
  Future<T?> validateJwt(String token);
  Middleware get verifyJwt;
  Middleware get authorization;
}
