extension WeeMapExtension<S> on Iterable<S> {
  /// Groups the elements in values by the value returned by key.
  /// Returns a map from keys computed by key to a list of all values for which key returns that key. The values appear in the list in the same
  ///relative order as in values.
  Map<T, List<S>> groupBy<T>(T Function(S) key) {
    var map = <T, List<S>>{};
    for (var element in this) {
      (map[key(element)] ??= []).add(element);
    }
    return map;
  }
}
