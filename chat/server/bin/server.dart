import 'dart:io';

import 'package:socket_io/socket_io.dart';

void main() {
  final server = Server();

  server.on('connection', (client) {
    onConnection(client);
  });

  server.listen(Platform.environment['POR'] ?? 3000);
}

void onConnection(Socket socket) {
  socket.on('enter_room', (data) {
    final name = data['name'];
    final room = data['room'];

    socket.join(room);
    socket.to(room).broadcast.emit('message:');
  });
}
