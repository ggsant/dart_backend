import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../infras/security/security_service.dart';
import 'api.dart';

class LoginApi extends Api {
  final SecurityService service;

  LoginApi(this.service);

  @override
  Handler getHandler({List<Middleware>? middlewares}) {
    final router = Router();

    router.post('/login', (Request request) async {
      final result = await request.readAsString();
      Map<String, dynamic> json = jsonDecode(result);
      final user = json['user'];
      final password = json['password'];

      if (user == 'adm' && password == '123') {
        final token = await service.generateJwt('1234');
        final response = await service.validateJwt(token);
        return Response.ok(response != null ? "Acesso Permitido" : "Token Invalido");
      } else {
        return Response.forbidden('Acesso negado!');
      }
    });

    return createHandler(router: router, middlewares: middlewares);
  }
}
