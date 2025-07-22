import 'package:core/core.dart';
import 'package:email_inmemory/email_inmemory.dart';
import 'package:test/test.dart';

void main() {
  group('EmailInMemory', () {
    late EmailInMemory client;

    setUp(() {
      client = EmailInMemory();
    });

    test('can be instantiated', () {
      expect(client, isNotNull);
    });

    group('sendTransactionalEmail', () {
      const validSenderEmail = 'sender@example.com';
      const validRecipientEmail = 'recipient@example.com';
      const invalidEmail = 'invalid-email';
      const templateId = 'd-12345';
      const templateData = {'otp_code': '123456'};

      test('completes normally for valid emails', () async {
        await expectLater(
          client.sendTransactionalEmail(
            senderEmail: validSenderEmail,
            recipientEmail: validRecipientEmail,
            templateId: templateId,
            templateData: templateData,
          ),
          completes,
        );
      });

      test('throws InvalidInputException for invalid sender email', () async {
        await expectLater(
          () => client.sendTransactionalEmail(
            senderEmail: invalidEmail,
            recipientEmail: validRecipientEmail,
            templateId: templateId,
            templateData: templateData,
          ),
          throwsA(isA<InvalidInputException>()),
        );
      });

      test(
        'throws InvalidInputException for invalid recipient email',
        () async {
          await expectLater(
            () => client.sendTransactionalEmail(
              senderEmail: validSenderEmail,
              recipientEmail: invalidEmail,
              templateId: templateId,
              templateData: templateData,
            ),
            throwsA(isA<InvalidInputException>()),
          );
        },
      );
    });
  });
}
