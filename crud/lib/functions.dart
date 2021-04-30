import 'dart:async';

import 'package:crud/controller/file/file_controller.dart';
import 'package:crud/controller/products/products_controller.dart';
import 'package:functions_framework/functions_framework.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

@CloudFunction()
FutureOr<Response> function(Request request) async {
  final router = Router();

  router.mount('/products/', ProductsController().router);

  return router(request);
}

@CloudFunction()
FutureOr<Response> fileFunction(Request request) async {
  final router = Router();

  router.mount('/files/', FilesController().router);

  return router(request);
}
