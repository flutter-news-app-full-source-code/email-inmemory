<div align="center">
  <img src="https://avatars.githubusercontent.com/u/202675624?s=400&u=dc72a2b53e8158956a3b672f8e52e39394b6b610&v=4" alt="Flutter News App Toolkit Logo" width="220">
  <h1>Email In-Memory</h1>
  <p><strong>An in-memory implementation of the `EmailClient` interface for the Flutter News App Toolkit.</strong></p>
</div>

<p align="center">
  <img src="https://img.shields.io/badge/coverage-100%25-green?style=for-the-badge" alt="coverage">
  <a href="https://flutter-news-app-full-source-code.github.io/docs/"><img src="https://img.shields.io/badge/LIVE_DOCS-VIEW-slategray?style=for-the-badge" alt="Live Docs: View"></a>
  <a href="https://github.com/flutter-news-app-full-source-code"><img src="https://img.shields.io/badge/MAIN_PROJECT-BROWSE-purple?style=for-the-badge" alt="Main Project: Browse"></a>
</p>

This `email_inmemory` package provides an in-memory implementation of the `EmailClient` interface within the [**Flutter News App Full Source Code Toolkit**](https://github.com/flutter-news-app-full-source-code). It is specifically designed for testing and development environments where actual email sending is not required. This package simulates the email dispatch process, allowing developers to verify email-related logic without the overhead or external dependencies of a live email service. It ensures consistent behavior and robust error handling based on the `email_client` contract.

## ⭐ Feature Showcase: Simplified Email Testing & Development

This package offers a comprehensive set of features for managing email sending operations in a simulated environment.

<details>
<summary><strong>🧱 Core Functionality</strong></summary>

### 🚀 `EmailClient` Implementation
- **`EmailInMemory` Class:** A concrete in-memory implementation of the `EmailClient` interface, providing a standardized way to simulate email sending.
- **Simulated Email Dispatch:** Accurately simulates the `sendTransactionalEmail` operation without sending actual emails, making it ideal for isolated testing.

### 🌐 Debugging & Validation
- **Console Logging:** Logs simulated email details (sender, recipient, template ID, template data) to the console, which is highly useful for debugging and verifying email content during development.
- **Input Validation:** Includes basic input validation and throws standard `HttpException` subtypes (from `core`) on failure, ensuring consistent error handling in a simulated context.

### 💉 Interface-Driven Design
- **Decoupled Logic:** By implementing the `EmailClient` interface, this package ensures that application logic remains decoupled from specific email service providers, allowing for flexible testing strategies.

> **💡 Your Advantage:** This package provides a reliable, in-memory email client that simplifies testing and development of email-related features. It eliminates the need for external email service dependencies during development, offering immediate feedback and consistent behavior for your email logic.

</details>

## 🔑 Licensing

This `email_inmemory` package is an integral part of the [**Flutter News App Full Source Code Toolkit**](https://github.com/flutter-news-app-full-source-code). For comprehensive details regarding licensing, including trial and commercial options for the entire toolkit, please refer to the main toolkit organization page.
