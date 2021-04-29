import 'dart:io';

import 'package:common/common.dart';
import 'package:socket_io/socket_io.dart';

void main() {
  final server = Server();

  server.on('connection', (client) {
    onConnection(client);
  });

  server.listen(Platform.environment['PORT'] ?? 3000);
}

void onConnection(Socket socket) {
  socket.on('enter_room', (data) {
    final name = data['name'];
    final room = data['room'];

    socket.join(room);
    socket.to(room).broadcast.emit(
          'message:',
          Socketevent(
            name: name,
            room: room,
            type: SocketeventType.enter_room,
          ).toJson(),
        );

    socket.on('disconnect', (data) {
      socket.to(room).broadcast.emit(
            'message:',
            Socketevent(
              name: name,
              room: room,
              type: SocketeventType.leave_room,
            ).toJson(),
          );
    });

    socket.on('message', (json) {
      socket.to(room).broadcast.emit(json);
    });
  });
}
