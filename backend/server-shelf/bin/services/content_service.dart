import '../models/content_model.dart';
import 'generic_service.dart';

class ContentService implements BaseService<ContentModel> {
  final Set<ContentModel> _fakeDb = {};

  bool hasElement(int id) => findObject(id) != null;

  @override
  bool delete(int id) {
    try {
      if (hasElement(id)) {
        _fakeDb.removeWhere((element) => element.id == id);
        return true;
      } else {
        throw ArgumentError('No content found with the id: $id');
      }
    } on ArgumentError catch (error) {
      throw Exception(error.message);
    } catch (error) {
      throw Exception('Error when trying delete the object.');
    }
  }

  @override
  Set<ContentModel> findAll() => _fakeDb;

  @override
  ContentModel? findObject(int id) {
    try {
      return _fakeDb.firstWhere((element) => element.id == id);
    } catch (error) {
      throw Exception('Error when trying find the object.');
    }
  }

  @override
  bool save(ContentModel value) {
    try {
      _fakeDb.add(value);
      return true;
    } catch (error) {
      throw Exception('Error when trying save the object.');
    }
  }

  @override
  bool edit(ContentModel value, int id) {
    try {
      if (hasElement(id)) {
        delete(id);
        save(value);
        return true;
      } else {
        throw ArgumentError('No content found with the id: $id');
      }
    } on ArgumentError catch (error) {
      throw Exception(error.message);
    } catch (error) {
      throw Exception('Error when trying edit the object.');
    }
  }
}
