import 'package:flutter/widgets.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:common/common.dart';

class ChatController {
  Socket socket;
  final String room;
  final String name;
  final listEvents = RxList<Socketevent>([]);
  final textControler = TextEditingController(text: '');
  final focusNode = FocusNode();

  ChatController(this.room, this.name) {
    _init();
  }

  void _init() {
    socket = io(
      API_SERVER,
      OptionBuilder().setTransports(['websocket']).build(),
    );
    socket.connect();
    socket.onConnect((_) {
      socket.emit('enter_room', {'room': room, 'name': name});
    });
    socket.on('message', (json) {
      final event = Socketevent.fromJson(json);
      listEvents.add(event);
    });
  }

  void send() {
    final event = Socketevent(
      name: name,
      room: room,
      message: textControler.text,
      type: SocketeventType.message,
    );
    listEvents.add(event);
    socket.emit('message', event.toJson());
    textControler.clear();
    focusNode.requestFocus();
  }

  void dispose() {
    socket.clearListeners();
    socket.dispose();
    textControler.dispose();
    focusNode.dispose();
  }
}
