# ht_email_inmemory

![coverage: percentage](https://img.shields.io/badge/coverage-100-green)
[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)
[![License: PolyForm Free Trial](https://img.shields.io/badge/License-PolyForm%20Free%20Trial-blue)](https://polyformproject.org/licenses/free-trial/1.0.0)

An in-memory implementation of the `HtEmailClient` interface, suitable for testing and development environments where actual email sending is not required.

## Getting Started

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  ht_email_inmemory:
    git:
      url: https://github.com/headlines-toolkit/ht-email-inmemory.git
      # Use a specific ref/tag for stability in production
      # ref: some-tag
```

Then, import the package:

```dart
import 'package:ht_email_inmemory/ht_email_inmemory.dart';
```

## Features

*   Provides an `HtEmailInMemory` class that implements the `HtEmailClient` interface.
*   Simulates the `sendTransactionalEmail` operation without sending actual emails.
*   Logs the simulated email details to the console, which is useful for debugging during development (e.g., viewing OTP codes).
*   Includes basic input validation and throws standard `ht_shared` exceptions on failure.

## Usage

Instantiate the client and use it where an `HtEmailClient` is expected. You can optionally provide a `Logger` instance.

```dart
import 'package:ht_email_client/ht_email_client.dart';
import 'package:ht_email_inmemory/ht_email_inmemory.dart';
import 'package:ht_shared/ht_shared.dart';
import 'package:logging/logging.dart';

void main() async {
  // Set up logging to see the output
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });

  // Instantiate the in-memory client
  final HtEmailClient emailClient = HtEmailInMemory();

  // Example: Sending a transactional email (simulated)
  try {
    await emailClient.sendTransactionalEmail(
      senderEmail: 'noreply@example.com',
      recipientEmail: 'test@example.com',
      templateId: 'd-12345',
      templateData: {'otp_code': '987654'},
    );
    print('Successfully simulated sending email.');
  } on HtHttpException catch (e) {
    print('Failed to send email: $e');
  }
}
```

## License

This package is licensed under the [PolyForm Free Trial](LICENSE). Please review the terms before use.
