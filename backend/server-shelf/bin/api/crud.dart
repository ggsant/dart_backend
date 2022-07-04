import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class CrudApi {
  Handler get handler {
    final router = Router();

    // Put the route according to what you want to return, for example: blog/news
    router.get('crud/content', (Request request) {
      return Response.ok('Content 01');
    });

    // informacao pelo path
    // http://localhost:8080/user/path/<gabriela>
    router.get('/user/path/<user>', (Request request, String user) {
      return Response.ok('O nome do usuario é $user');
    });

    // informacao pelo quey
    // http://localhost:8080/user/query?name=gabriela => map no qual chave=valor
    router.get('/user/query', (Request request) {
      final user = request.url.queryParameters['name'];
      return Response.ok('O nome do usuario é $user');
    });

    // mais de um quey
    // http://localhost:8080/user/queries?name=gabriela&&age=25
    router.get('/user/queries', (Request request) {
      final user = request.url.queryParameters['name'];
      final age = request.url.queryParameters['age'];

      return Response.ok('O nome do usuario é $user e tem $age anos');
    });

    router.post('/login', (Request request) async {
      final result = await request.readAsString();
      Map<String, dynamic> json = jsonDecode(result);
      final user = json['user'];
      final password = json['password'];
      if (user == 'adm' && password == '123') {
        return Response.ok('Bem vindo $user');
      } else {
        return Response.forbidden('Acesso negado!');
      }
    });

    // devolver um html
    // Mime type
    router.get('/', (Request request) {
      return Response(200, body: '<h1> Rota padrao </h1>', headers: {'content-type': 'text/html'});
    });

    router.post('/login/json', (Request request) async {
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
