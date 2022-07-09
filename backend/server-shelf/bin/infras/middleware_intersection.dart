import 'package:shelf/shelf.dart';

class MiddlewareIntersection {
  Middleware get middleware {
    return createMiddleware(
      responseHandler: (Response response) {
        return response.change(
          headers: {
            'content-type': 'application/json',
          },
        );
      },
    );
  }
}
