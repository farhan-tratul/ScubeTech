# Scube - Solar Energy Monitoring App ☀️⚡

[![Flutter CI](https://github.com/farhan-tratul/ScubeTech/actions/workflows/flutter.yml/badge.svg)](https://github.com/farhan-tratul/ScubeTech/actions/workflows/flutter.yml)
![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Flutter](https://img.shields.io/badge/Flutter-3.0%2B-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.0%2B-0175C2?logo=dart)

**Scube** is a comprehensive mobile dashboard designed for monitoring solar power plant performance. It provides real-time analytics, weather conditions, energy generation metrics, and detailed inverter status reports in a clean, user-friendly interface.

---

## 📱 App Screenshots

| **splash** | **Login** | **Detailed Summary** | **Home Dashboard** |
|:---:|:---:|:---:|:---:|
<img src="https://projects.farhanshariar.com/apk-hub/splash.png" alt="splash  Screen" width="200"/>| <img src="https://projects.farhanshariar.com/apk-hub/login.png" alt="Login Screen" width="200"/> | <img src="https://projects.farhanshariar.com/apk-hub/sum.png" alt="Summary Page" width="200"/> | <img src="https://projects.farhanshariar.com/apk-hub/home.png" alt="Home Screen" width="200"/> |

## ✨ Key Features

- **Real-Time Monitoring**: detailed view of Live AC Power, Plant Generation, and Performance Ratio (PR).
- **Weather Widget**: Integrated display for module temperature, wind speed, wind direction, and effective irradiation.
- **Data Comparison**: "Yesterday vs Today" data tables for quick performance analysis.
- **Responsive Design**: Pixel-perfect UI that adapts seamlessly between mobile phones and tablets.
- **Expandable Inverter Cards**: Drill down into specific inverter (LT) performance, including lifetime energy, daily yield, and live power.
- **Modern UI/UX**: Custom gradient components, glassmorphism effects, and intuitive navigation.

---

## 🛠 Tech Stack

- **Framework**: [Flutter](https://flutter.dev/)
- **Language**: [Dart](https://dart.dev/)
- **State Management**: `SetState` (demonstrated), scalable to Riverpod/Bloc.
- **Navigation**: Named Routes.
- **Assets**: Custom asset integration for high-fidelity icons.

---

## 🧪 Testing

Every push runs `flutter analyze` and `flutter test` on GitHub Actions (badge above). Widget tests in `test/app_flow_test.dart` check that:

- the app opens on the splash screen and moves to login after 3 seconds
- the login screen shows the branding, both input fields and the Login button
- "Forgot password?" shows its message

Writing these tests caught two layout and lifecycle bugs, both now fixed: the sign-up row overflowed on narrow screens, and delayed animations could start after a screen was closed.

## 🚀 Getting Started

Follow these steps to get the project running on your local machine.

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) installed.
- VS Code or Android Studio.
- An Emulator or Physical Device.
