# School Management App – Flutter Frontend

This Flutter application is a mobile client for the School Management System built with Laravel (PHP) as backend.

## 📱 Features

- User Authentication (Login, Registration, Logout)
- Role-based Access:
  - Admins can manage all students and user roles
  - Teachers can view all students
  - Students can view and edit their own profile
- Clean and responsive UI
- Token-based authentication using Laravel Sanctum
- Error handling and API response management

## 🔧 Tech Stack

- Flutter (Dart)
- Provider
- HTTP for API requests
- Token-based Authentication (Sanctum)

## 🚀 Getting Started

1. Clone the repository
2. Run `flutter pub get`
3. Set up API base URL in `lib/config/app_config.dart`
4. Run the app using:
   ```bash
   flutter run
