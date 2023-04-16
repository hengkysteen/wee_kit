import 'package:flutter_test/flutter_test.dart';
import 'package:wee_kit/extentions/index.dart';

void main() {
  group('WeeStringExtension', () {
    test('toCapitalize() should capitalize first letter of string', () {
      // Arrange
      final input1 = 'ayam';
      final input2 = 'Ayam';
      final input3 = '';
      final input4 = '   ';
      // Act
      final result1 = input1.toCapitalize();
      final result2 = input2.toCapitalize();
      final result3 = input3.toCapitalize();
      final result4 = input4.toCapitalize();
      // Assert
      expect(result1, 'Ayam');
      expect(result2, 'Ayam');
      expect(result3, '');
      expect(result4, '   ');
    });

    test('removeEmptyLine() should remove empty lines from string', () {
      // Arrange
      final input = "ayam\n\n\ngoreng";
      final expectedOutput = "ayam\ngoreng";
      // Act
      final result = input.removeEmptyLine();
      // Assert
      expect(result, equals(expectedOutput));
    });
    test('toDate() should convert string to DateTime', () {
      // Arrange
      final dateStr1 = '2021-04-16';
      final dateStr2 = '2021-04-16 12:34:56';
      final dateStr3 = '2021-04-16T12:34:56.789Z';

      // Act
      final date1 = dateStr1.toDate();
      final date2 = dateStr2.toDate();
      final date3 = dateStr3.toDate();

      // Assert
      expect(date1, DateTime(2021, 4, 16));
      expect(date2, DateTime(2021, 4, 16, 12, 34, 56));
      expect(date3, DateTime.utc(2021, 4, 16, 12, 34, 56, 789));
    });

    test('toPascalCase() should convert string to PascalCase', () {
      // Arrange
      final input = 'ayam goreng';
      final expectedOutput1 = 'AyamGoreng';
      final expectedOutput2 = 'Ayam Goreng';
      // Act
      final result1 = input.toPascalCase();
      final result2 = input.toPascalCase(addSpace: true);
      // Assert
      expect(result1, equals(expectedOutput1));
      expect(result2, equals(expectedOutput2));
    });
    test('toCamelCase() should convert string to camelCase', () {
      // Arrange
      final input = 'ayam goreng';
      final expectedOutput1 = 'ayamGoreng';
      final expectedOutput2 = 'ayam Goreng';
      // Act
      final result1 = input.toCamelCase();
      final result2 = input.toCamelCase(addSpace: true);
      // Assert
      expect(result1, equals(expectedOutput1));
      expect(result2, equals(expectedOutput2));
    });
  });
}
