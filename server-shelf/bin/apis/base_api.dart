import 'package:shelf/shelf.dart';
import '../dependency_injector/dependency_injector.dart';
import '../infras/security/security_service_generic.dart';

abstract class BaseApi {
  Handler getHandler({
    List<Middleware>? middlewares,
    bool isSecurity = true,
  });

  Handler createHandler({
    required Handler router,
    required bool isSecurity,
    List<Middleware>? middlewares,
  }) {
    middlewares ??= [];

    if (isSecurity) {
      final securityService = DependencyInjector().getInstance<SecurityService>();

      middlewares.addAll([
        securityService.authorization,
        securityService.verifyJwt,
      ]);
    }

    var pipeline = Pipeline();

    for (var middleware in middlewares) {
      pipeline = pipeline.addMiddleware((middleware));
    }

    return pipeline.addHandler(router);
  }
}
