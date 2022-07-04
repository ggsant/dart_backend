import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class LoginApi {
  Handler get handler {
    final router = Router();

    router.post('/login', (Request request) async {
      final result = await request.readAsString();
      Map<String, dynamic> json = jsonDecode(result);
      final user = json['user'];
      final password = json['password'];

      final jsonResponse = jsonEncode({
        'token': 'adjsklewqruifdjks',
        'userId': '$user',
      });

      if (user == 'adm' && password == '123') {
        return Response.ok(jsonResponse, headers: {
          'content-type': 'application/json',
        });
      } else {
        return Response.forbidden('Acesso negado!');
      }
    });

    return router;
  }
}
