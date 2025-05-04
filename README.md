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

*   Provides an `HtEmailInMemoryClient` class that implements the `HtEmailClient` interface.
*   Simulates the `sendOtpEmail` operation without sending actual emails.
*   Includes basic input validation (e.g., email format) and throws standard `ht_shared` exceptions (`InvalidInputException`) on failure, adhering to the client contract.
*   Useful for dependency injection in testing or local development setups.

## Usage

Instantiate the client and use it where an `HtEmailClient` is expected:

```dart
import 'package:ht_email_client/ht_email_client.dart';
import 'package:ht_email_inmemory/ht_email_inmemory.dart';
import 'package:ht_shared/ht_shared.dart'; // For exceptions

void main() async {
  // Instantiate the in-memory client
  final HtEmailClient emailClient = HtEmailInMemoryClient();

  const validEmail = 'test@example.com';
  const invalidEmail = 'invalid-email';
  const otp = '123456';

  // Example: Sending an OTP (simulated)
  try {
    print('Attempting to send OTP to $validEmail...');
    await emailClient.sendOtpEmail(recipientEmail: validEmail, otpCode: otp);
    print('Successfully simulated sending OTP to $validEmail.');
  } on HtHttpException catch (e) {
    print('Failed to send OTP to $validEmail: $e');
  }

  // Example: Attempting with invalid input
  try {
    print('\nAttempting to send OTP to $invalidEmail...');
    await emailClient.sendOtpEmail(recipientEmail: invalidEmail, otpCode: otp);
    print('Successfully simulated sending OTP to $invalidEmail.'); // Should not reach here
  } on InvalidInputException catch (e) {
    // Expected exception for invalid email format
    print('Caught expected exception for $invalidEmail: $e');
  } on HtHttpException catch (e) {
    // Catch other potential standard exceptions
    print('Caught unexpected exception for $invalidEmail: $e');
  }
}

```

## License

This package is licensed under the [PolyForm Free Trial](LICENSE). Please review the terms before use.
