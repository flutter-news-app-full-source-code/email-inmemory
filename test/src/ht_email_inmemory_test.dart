import 'package:ht_email_inmemory/ht_email_inmemory.dart';
import 'package:ht_shared/ht_shared.dart';
import 'package:test/test.dart';

void main() {
  group('HtEmailInMemoryClient', () {
    late HtEmailInMemoryClient client;

    setUp(() {
      client = const HtEmailInMemoryClient();
    });

    test('can be instantiated', () {
      expect(client, isNotNull);
    });

    group('sendOtpEmail', () {
      const validEmail = 'test@example.com';
      const invalidEmail = 'invalid-email';
      const otpCode = '123456';

      test('completes normally for valid email', () async {
        await expectLater(
          client.sendOtpEmail(
            recipientEmail: validEmail,
            otpCode: otpCode,
          ),
          completes, // Verifies the Future completes without error
        );
      });

      test('throws InvalidInputException for invalid email', () async {
        await expectLater(
          () => client.sendOtpEmail(
            recipientEmail: invalidEmail,
            otpCode: otpCode,
          ),
          throwsA(isA<InvalidInputException>()),
        );
      });
    });
  });
}
