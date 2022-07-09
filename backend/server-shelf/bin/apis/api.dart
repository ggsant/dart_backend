import 'dart:math';

import 'package:shelf/shelf.dart';

abstract class Api {
  Handler getHandler({List<Middleware>? middlewares});
  Handler createHandler({
    required Handler router,
    List<Middleware>? middlewares,
  }) {
    middlewares ??= [];

    var pipe = Pipeline();

    for (var middleware in middlewares) {
      pipe = pipe.addMiddleware((middleware));
    }

    return pipe.addHandler(router);
  }
}
