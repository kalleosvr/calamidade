import 'package:core_module/core_module.dart';
import 'package:dashboard/app/features/home/new_requests/data/adapters/new_request_adapter.dart';
import 'package:dashboard/app/features/home/new_requests/interactor/entities/new_request_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NewRequestAdapter', () {
    test('fromJson should return a NewRequestEntity object', () {
      // Arrange
      final json = {
        'id': 1,
        'name': 'John Doe',
        'status': 1,
        'city': 'New York',
        'phone': '1234567890',
        'requestedIncome': 'requestedIncome',
        'date': 'date',
        'bank': 'ABC Bank',
        'agency': '1234',
        'account': '5678',
        'urlImage': 'https://example.com/image.jpg',
        'description': 'Lorem ipsum dolor sit amet',
      };

      // Act
      final result = NewRequestAdapter.fromJson(json);

      // Assert
      expect(result, isA<NewRequestEntity>());
      expect(result.id, equals(1));
      expect(result.name, equals('John Doe'));
      expect(result.status, equals(RequestStatusEnum.fromId(1)));
      expect(result.city, equals('New York'));
      expect(result.phone, equals('1234567890'));
      expect(result.bank, equals('ABC Bank'));
      expect(result.agency, equals('1234'));
      expect(result.account, equals('5678'));
      expect(result.urlImage, equals('https://example.com/image.jpg'));
      expect(result.description, equals('Lorem ipsum dolor sit amet'));
    });

    // Add more tests here
  });
}
