import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

class CustomServer {
  Future<void> initializeServer({
    required Handler handler,
    required String address,
    required int port,
  }) async {
    try {
      print('Starting the server 🙏');
      await shelf_io.serve(handler, address, port);
      print('Server started: http://localhost:8080 👍');
    } catch (e) {
      print('Error trying to start the server. 👎');
    }
  }
}
