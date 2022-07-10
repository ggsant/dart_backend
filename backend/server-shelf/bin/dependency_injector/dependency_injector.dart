typedef CreateInstance<T> = T Function();

class DependencyInjector {
  DependencyInjector._();
  static final _instance = DependencyInjector._();

  factory DependencyInjector() => _instance;

  final _instancesMap = <Type, _InstanceGenerator<Object>>{};

  // Instance Register
  void registerInstance<T extends Object>(
    CreateInstance<T> instance, {
    bool isSingleton = true,
  }) {
    _instancesMap[T] = _InstanceGenerator(instance, isSingleton);
  }

  // Get Register
  T getInstance<T extends Object>() {
    final Object? instance = _instancesMap[T]?.getInstance();
    if (instance != null && instance is T) return instance;
    throw Exception('[ERROR] -> Instance ${T.toString()} not founded ');
  }

  call<T extends Object>() => getInstance<T>();
}

class _InstanceGenerator<T> {
  _InstanceGenerator(this._createInstance, bool isSingleton) : _isFirstGetInstance = isSingleton;

  final CreateInstance<T> _createInstance;

  T? _instance;
  bool _isFirstGetInstance = false;

  T? getInstance() {
    if (_isFirstGetInstance) {
      _instance = _createInstance();
      _isFirstGetInstance = false;
    }
    return _instance ?? _createInstance();
  }
}
