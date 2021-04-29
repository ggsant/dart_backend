import 'package:common/common.dart';
import 'package:test/test.dart';

void main() {
  setUp(() {});

  final json = {
    'name': 'Gabi',
    'room': 'sala 1',
    'message': '',
    'type': 'SocketeventType.enter_room',
  };

  test('Should ', () async {
    //*arrange
    final event = Socketevent.fromJson(json);
    //?act
    //!assert
    expect(event.name, 'Gabi');
    expect(event.type, SocketeventType.enter_room);
    expect(event.toJson(), json);
  });
}
