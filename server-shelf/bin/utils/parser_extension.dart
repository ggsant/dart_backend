extension ParserExtension on String {
  toType(Type object) {
    switch (object) {
      case String:
        return toString();
      case int:
        return int.parse(toString());
      default:
        return toString();
    }
  }
}
