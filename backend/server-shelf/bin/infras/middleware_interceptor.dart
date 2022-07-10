import 'package:shelf/shelf.dart';

class MiddlewareInterceptor {
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
