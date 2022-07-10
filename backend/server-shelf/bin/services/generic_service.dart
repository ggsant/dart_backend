abstract class BaseService<T> {
  T? findObject(int id);
  Set<T> findAll();
  bool save(T value);
  bool edit(T value, int id);
  bool delete(int id);
}
