import 'dart:async';

import 'package:backend/user_controller.dart';
import 'package:functions_framework/functions_framework.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

@CloudFunction()
FutureOr<Response> function(Request request) async {
  final router = Router();

  //? isso daqui é um express
  // handler
  router.get('/', (Request request) {
    return Response.ok('Hellou world');
  });

  // as rotas serao montadas do path p frente
  router.mount('/user/', UserController().router);

  return router(request);
}

// @CloudFunction()
// FutureOr<Response> function(Request request) async {
//   final router = Router();

//   //? isso daqui é um express
//   // handler
//   router.get('/', (Request request) {
//     return Response.ok('Hellou world');
//   });

//   router.get('/user', (Request request) {
//     return Response.ok('retorna usuario');
//   });

//   //rota dinamica
//   router.get('/user/<id>', (Request request, String id) {
//     return Response.ok('retorna usuario id: $id');
//   });

//   return router(request);
// }

// @CloudFunction()
// Response hangleGet(Request request) => Response.ok('Hello, hangleGet');
