import 'package:ht_email_inmemory/ht_email_inmemory.dart';
import 'package:ht_shared/ht_shared.dart';
import 'package:test/test.dart';

void main() {
  group('HtEmailInMemory', () {
    late HtEmailInMemory client;

    setUp(() {
      client = HtEmailInMemory();
    });

    test('can be instantiated', () {
      expect(client, isNotNull);
    });

    group('sendTransactionalEmail', () {
      const validEmail = 'test@example.com';
      const invalidEmail = 'invalid-email';
      const templateId = 'd-12345';
      const templateData = {'otp_code': '123456'};

      test('completes normally for valid email', () async {
        await expectLater(
          client.sendTransactionalEmail(
            recipientEmail: validEmail,
            templateId: templateId,
            templateData: templateData,
          ),
          completes,
        );
      });

      test('throws InvalidInputException for invalid email', () async {
        await expectLater(
          () => client.sendTransactionalEmail(
            recipientEmail: invalidEmail,
            templateId: templateId,
            templateData: templateData,
          ),
          throwsA(isA<InvalidInputException>()),
        );
      });
    });
  });
}
