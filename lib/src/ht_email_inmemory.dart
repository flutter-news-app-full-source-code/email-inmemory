import 'package:ht_email_client/ht_email_client.dart';
import 'package:ht_shared/ht_shared.dart';
import 'package:logging/logging.dart';

/// {@template ht_email_inmemory_client}
/// An in-memory implementation of [HtEmailClient] for testing or local
/// development.
///
/// This client simulates the behavior of sending emails without actually
/// dispatching them. It logs the email details for debugging purposes.
/// {@endtemplate}
class HtEmailInMemory implements HtEmailClient {
/// {@macro ht_email_inmemory_client}
  HtEmailInMemory({Logger? logger})
    : _log = logger ?? Logger('HtEmailInMemory');

  final Logger _log;

  // Basic email regex for simple validation.
  static final _emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  @override
  Future<void> sendTransactionalEmail({
    required String recipientEmail,
    required String templateId,
    required Map<String, dynamic> templateData,
  }) async {
    // Simulate input validation as per the interface contract.
    if (!_emailRegExp.hasMatch(recipientEmail)) {
      throw InvalidInputException(
        'Invalid recipient email format: $recipientEmail',
      );
    }

    // Log the simulated email for debugging purposes.
    _log.info('''
      --- 📧 Simulating Email Send 📧 ---
      Recipient: $recipientEmail
      Template ID: $templateId
      Template Data: $templateData
      ---------------------------------
      ''');

    // Simulate successful completion.
    await Future<void>.delayed(Duration.zero);
  }
}
