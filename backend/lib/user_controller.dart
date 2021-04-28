import 'dart:async';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
part 'user_controller.g.dart';

class UserController {
  @Route.get('/')
  FutureOr<Response> getAll(Request request) {
    return Response.ok('retorna usuario');
  }

  @Route.get('/<userId>')
  FutureOr<Response> getUser(Request request, String userId) {
    return Response.ok('retorna usuario: $userId');
  }

  // getter do router

  Router get router => _$UserControllerRouter(this);
}
