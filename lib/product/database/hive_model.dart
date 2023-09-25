mixin HiveModel<T> {
  String get modelKey => T.toString();
}
