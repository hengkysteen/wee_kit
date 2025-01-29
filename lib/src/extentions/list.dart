extension WeeListExtension<T> on List<T> {
  /// Ambil elemen terakhir sejumlah [count]
  List<T> takeLast(int count) => skip(length - count).toList();
}