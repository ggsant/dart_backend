library common;

const String API_SERVER = 'https://dart-socket.herokuapp.com/';

class Socketevent {
  final String name;
  final String room;
  final String message;
  final SocketeventType type;

  Socketevent({
    required this.name,
    required this.room,
    required this.message,
    required this.type,
  });

  Map toJson() {
    return {
      'name': name,
      'room': room,
      'message': message,
      'type': type.toString(),
    };
  }

  factory Socketevent.fromJson(Map json) {
    return Socketevent(
      name: json['name'],
      room: json['room'],
      message: json['message'],
      type: SocketeventType.values
          .firstWhere((element) => element.toString() == json['type']),
    );
  }
}

enum SocketeventType { enter_room, leave_room, message }
