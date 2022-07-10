import 'package:shelf/shelf.dart';

abstract class SecurityService<T> {
  Future<String> generateJwt(String userId);
  Future<T?> validateJwt(String token);
  Middleware get verifyJwt;
  Middleware get authorization;
}
