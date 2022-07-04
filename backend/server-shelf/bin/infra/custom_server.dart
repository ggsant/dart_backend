import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

class CustomServer {
  Future<void> initializeServer(Handler handler) async {
    final String address = 'localhost';
    final int port = 8080;
    print('Starting the server 🙏');

    try {
      print('Server started: http://localhost:8080 👍');
      await shelf_io.serve(handler, address, port);
    } catch (e) {
      print('Error trying to start the server. 👎');
    }
  }
}
