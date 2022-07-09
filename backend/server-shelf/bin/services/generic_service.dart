abstract class GenericService<T> {
  T? findObject(int id);
  Set<T> findAll();
  bool save(T value);
  bool delete(int id);
}
