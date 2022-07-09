import '../models/content_model.dart';
import 'generic_service.dart';

class ContentService implements GenericService<ContentModel> {
  final Set<ContentModel> _fakeDb = {};

  @override
  bool delete(int id) {
    try {
      _fakeDb.removeWhere((element) => element.id == id);
      return true;
    } catch (error) {
      Exception('Error when trying delete the object.');
      return false;
    }
  }

  @override
  Set<ContentModel> findAll() => _fakeDb;

  @override
  ContentModel? findObject(int id) {
    try {
      return _fakeDb.firstWhere((element) => element.id == id);
    } catch (error) {
      Exception('Error when trying delete the object.');
      return null;
    }
  }

  @override
  bool save(ContentModel value) {
    try {
      final obj = _fakeDb.firstWhere((element) => element.id == value.id, orElse: () => value);
      _fakeDb.add(obj);
      return true;
    } catch (error) {
      Exception('Error when trying save the object.');
      return false;
    }
  }
}
