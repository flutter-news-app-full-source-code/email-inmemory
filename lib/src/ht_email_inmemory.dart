import 'package:ht_email_client/ht_email_client.dart';
import 'package:ht_shared/ht_shared.dart';

/// {@template ht_email_inmemory_client}
/// An in-memory implementation of [HtEmailClient] for testing or local
/// development.
///
/// This client simulates the behavior of sending emails without actually
/// dispatching them. It primarily focuses on validating input and completing
/// the operation successfully.
/// {@endtemplate}
class HtEmailInMemoryClient implements HtEmailClient {
  /// {@macro ht_email_inmemory_client}
  const HtEmailInMemoryClient();

  // Basic email regex for simple validation.
  static final _emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  @override
  Future<void> sendOtpEmail({
    required String recipientEmail,
    required String otpCode,
  }) async {
    // Simulate input validation as per the interface contract.
    if (!_emailRegExp.hasMatch(recipientEmail)) {
      throw InvalidInputException(
        'Invalid recipient email format: $recipientEmail',
      );
    }

    // In-memory implementation doesn't actually send an email.
    // We can optionally log the action here for debugging purposes.
    // print(
    //   'Simulating OTP email send to: $recipientEmail with code: $otpCode',
    // );

    // Simulate successful completion.
    await Future<void>.delayed(Duration.zero);
  }
}
