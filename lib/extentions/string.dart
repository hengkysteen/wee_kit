/// [String] Extension
extension WeeStringExtension on String {
  /// Capitalizes the first letter of a string and converts the rest of the string to lowercase.
  ///
  /// This extension method takes a string and capitalizes the first letter of the string
  /// while converting the rest of the string to lowercase. If the string is empty or only
  /// contains whitespace characters, the method returns the original string.
  ///
  /// For example, the string "hELlo WoRLd" would be converted to "Hello world".
  ///
  /// Returns the capitalized string.
  ///
  String toCapitalize() => this.isNotEmpty ? "${this[0].toUpperCase()}${substring(1).toLowerCase()}" : '';

  /// Removes empty lines from a multi-line string.
  ///
  /// This extension method removes any lines from the string that contain only whitespace
  /// characters (spaces, tabs, etc.), or no characters at all. It preserves leading and
  /// trailing whitespace on lines that are not empty.
  ///
  /// For example, the string "  \n\nHello\n\n\nworld!\n\n " would be cleaned up to "  \nHello\nworld!\n ".
  ///
  /// Returns the string with empty lines removed.
  ///
  String removeEmptyLine() => this.replaceAll(RegExp(r'\n\s*\n'), '\n');

  /// Examples of accepted strings:
  ///
  /// * `"2012-02-27"`
  /// * `"2012-02-27 13:27:00"`
  /// * `"2012-02-27 13:27:00.123456789z"`
  /// * `"2012-02-27 13:27:00,123456789z"`
  /// * `"20120227 13:27:00"`
  /// * `"20120227T132700"`
  /// * `"20120227"`
  /// * `"+20120227"`
  /// * `"2012-02-27T14Z"`
  /// * `"2012-02-27T14+00:00"`
  /// * `"-123450101 00:00:00 Z"`: in the year -12345.
  /// * `"2002-02-27T14:00:00-0500"`: Same as `"2002-02-27T19:00:00Z"`
  ///
  DateTime toDate() => DateTime.parse(this);

  /// Returns a [String] converted to PascalCase.
  ///
  /// The optional parameter [addSpace] determines whether to include spaces
  /// between the words in the resulting [String]. By default, it is set to false.
  /// If set to true, the resulting [String] will have spaces between the words.
  ///
  /// The conversion is done by splitting the original [String] by any whitespace or
  /// underscore characters and then capitalizing the first letter of each resulting
  /// word while converting the rest of the letters to lowercase.
  ///
  /// Example:
  ///  ```dart
  /// final String input = 'foo bar_baz';
  /// final String output = input.toPascalCase(addSpace: true);
  /// print(output); // Output: 'Foo BarBaz'
  /// ```
  ///
  String toPascalCase({bool addSpace = false}) {
    List<String> words = this.split(new RegExp(r'[\s_]+'));
    List<String> pascalWords = [];
    for (String word in words) {
      String pascalWord = '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}';
      pascalWords.add(pascalWord);
    }
    String result = pascalWords.join(addSpace ? ' ' : '');
    return result;
  }

  // Returns a [String] converted to camelCase.
  ///
  /// The optional parameter [addSpace] determines whether to include spaces
  /// between the words in the resulting [String]. By default, it is set to false.
  /// If set to true, the resulting [String] will have spaces between the words.
  ///
  /// The conversion is done by splitting the original [String] by any whitespace or
  /// underscore characters and then converting the first letter of each resulting
  /// word to lowercase (except for the first word, which is converted to all lowercase)
  /// while converting the rest of the letters to lowercase.
  ///
  /// Example:
  ///
  ///  ```dart
  /// final String input = 'foo bar_baz';
  /// final String output = input.toCamelCase(addSpace: true);
  /// print(output); // Output: 'foo barBaz'
  /// ```
  String toCamelCase({bool addSpace = false}) {
    List<String> words = this.split(new RegExp(r'[\s_]+'));
    List<String> camelWords = [];
    for (int i = 0; i < words.length; i++) {
      String camelWord;
      if (i == 0) {
        camelWord = words[i].toLowerCase();
      } else {
        camelWord = '${words[i][0].toUpperCase()}${words[i].substring(1).toLowerCase()}';
      }
      camelWords.add(camelWord);
    }
    String result = camelWords.join(addSpace ? ' ' : '');
    return result;
  }
}
