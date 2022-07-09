import 'package:shelf/shelf.dart';

import 'apis/crud.dart';
import 'apis/login_api.dart';
import 'infras/custom_server.dart';
import 'infras/middleware_intersection.dart';
import 'infras/security/security_service.dart';
import 'services/content_service.dart';
import 'utils/custom_env.dart';

void main() async {
  final service = ContentService();
  final securityService = SecurityService();

  final cascadeHandler = Cascade() //
      .add((LoginApi(securityService).getHandler()))
      .add((CrudApi(service).getHandler(middlewares: [
        securityService.authorization,
        securityService.verifyJwt,
      ])))
      .handler;

  final handler = Pipeline() //
      .addMiddleware(logRequests())
      .addMiddleware(MiddlewareIntersection().middleware)
      .addHandler(cascadeHandler);

  await CustomServer().initializeServer(
    address: await CustomEnv.get<String>(key: 'server_address'),
    port: await CustomEnv.get<int>(key: 'server_port'),
    handler: handler,
  );
}
