import 'package:flutter_test/flutter_test.dart';
import 'package:wee_kit/extentions/index.dart';

void main() {
  test('groupBy() should group people by older age', () {
    // arrange
    final people = [
      {'name': 'Alice', 'age': 25},
      {'name': 'Bob', 'age': 30},
      {'name': 'Charlie', 'age': 25},
      {'name': 'Dave', 'age': 35},
      {'name': 'Eve', 'age': 30},
    ];

    // act
    final result = people.groupBy<int>((person) => person['age'] as int);

    // assert
    expect(result.keys.toList(), [25, 30, 35]);

    expect(result[25], [
      {'name': 'Alice', 'age': 25},
      {'name': 'Charlie', 'age': 25},
    ]);

    expect(result[30], [
      {'name': 'Bob', 'age': 30},
      {'name': 'Eve', 'age': 30},
    ]);

    expect(result[35], [
      {'name': 'Dave', 'age': 35},
    ]);
  });
}
