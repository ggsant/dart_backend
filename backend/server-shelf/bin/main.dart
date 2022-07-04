import 'package:shelf/shelf.dart';

import 'api/crud.dart';
import 'api/login_api.dart';
import 'infra/custom_server.dart';

void main() async {
  final cascadeHandler = Cascade() //
      .add((LoginApi().handler))
      .add((CrudApi().handler))
      .handler;

  final pipe = Pipeline().addMiddleware(logRequests()).addHandler(cascadeHandler);

  CustomServer().initializeServer(pipe);
}
