import 'dart:async';

import 'package:crud/controller/products_controller.dart';
import 'package:functions_framework/functions_framework.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

@CloudFunction()
FutureOr<Response> function(Request request) async {
  // A shelf Router routes requests to handlers based on HTTP verb and route pattern.
  final router = Router();

  router.mount('/products/', ProductsController().router);

  return router(request);
}
