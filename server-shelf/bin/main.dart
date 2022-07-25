import 'package:shelf/shelf.dart';
import 'apis/crud.dart';
import 'apis/login_api.dart';
import 'dependency_injector/container.dart';
import 'infras/custom_server.dart';
import 'infras/middleware_interceptor.dart';
import 'utils/custom_env.dart';

void main() async {
  final di = Container.initialize();
  final cascadeHandler = Cascade() //
      .add(di.getInstance<LoginApi>().getHandler(isSecurity: false))
      .add(di.getInstance<CrudApi>().getHandler())
      .handler;

  final handler = Pipeline() //
      .addMiddleware(logRequests())
      .addMiddleware(MiddlewareInterceptor().middleware)
      .addHandler(cascadeHandler);

  await CustomServer().initializeServer(
    address: await CustomEnv.get<String>(key: 'server_address'),
    port: await CustomEnv.get<int>(key: 'server_port'),
    handler: handler,
  );
}
