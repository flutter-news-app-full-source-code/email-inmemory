import 'package:core/core.dart';
import 'package:email_client/email_client.dart';
import 'package:logging/logging.dart';

/// {@template email_inmemory_client}
/// An in-memory implementation of [EmailClient] for testing or local
/// development.
///
/// This client simulates the behavior of sending emails without actually
/// dispatching them. It logs the email details for debugging purposes.
/// {@endtemplate}
class EmailInMemory implements EmailClient {
  /// {@macro email_inmemory_client}
  EmailInMemory({Logger? logger}) : _log = logger ?? Logger('EmailInMemory');

  final Logger _log;

  // Basic email regex for simple validation.
  static final _emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  @override
  Future<void> sendTransactionalEmail({
    required String senderEmail,
    required String recipientEmail,
    required String templateId,
    required Map<String, dynamic> templateData,
  }) async {
    // Simulate input validation as per the interface contract.
    if (!_emailRegExp.hasMatch(senderEmail)) {
      throw InvalidInputException('Invalid sender email format: $senderEmail');
    }
    if (!_emailRegExp.hasMatch(recipientEmail)) {
      throw InvalidInputException(
        'Invalid recipient email format: $recipientEmail',
      );
    }

    // Log the simulated email for debugging purposes.
    _log.info('''
      --- 📧 Simulating Email Send 📧 ---
      Sender: $senderEmail
      Recipient: $recipientEmail
      Template ID: $templateId
      Template Data: $templateData
      ---------------------------------
      ''');

    // Simulate successful completion.
    await Future<void>.delayed(Duration.zero);
  }
}
