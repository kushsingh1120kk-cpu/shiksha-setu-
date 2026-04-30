# 📚 Shiksha Setu - CBSE Study App

A comprehensive Flutter application for CBSE Board students (Class 9-12) with complete study materials, PDFs, voice support, and offline functionality.

## ✨ Features

- 🔍 **Smart Search** - Search subjects, chapters, and assignments
- 📚 **Class Selection** - Classes 9, 10, 11, 12
- 🎓 **Stream Selection** - Science, Arts, Commerce
- 📖 **Chapter Materials** - Complete syllabus with PDFs
- 📝 **Assignments** - Practice problems and assignments
- 📥 **PDF Download** - Download study materials offline
- 🎙️ **Voice Input** - Voice-based search and commands
- 🔖 **Bookmarks** - Save favorite chapters
- 🌗 **Dark Mode Ready** - Beautiful UI
- 🌐 **Hindi & English** - Multilingual support
- 📱 **Offline Mode** - Access content without internet
- 🔔 **Notifications** - Assignment reminders

## 📋 Screenshots

[Add screenshots here]

## 🛠️ Tech Stack

- **Flutter** 3.13.0+
- **Dart** 3.0.0+
- **Material Design 3**
- **Firebase** (optional - for backend)
- **SQLite** - Local database
- **PDF** - PDF viewing and downloading
- **Speech-to-Text** - Voice input

## 📦 Dependencies

```yaml
google_fonts: ^6.1.0
pdf: ^3.10.0
permission_handler: ^11.4.3
speech_to_text: ^6.6.0
shared_preferences: ^2.2.2
path_provider: ^2.1.1
http: ^1.1.0
sqflite: ^2.3.0
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK 3.13.0 or higher
- Android SDK (for Android builds)
- Xcode (for iOS builds)

### Installation

```bash
# Clone the repository
git clone https://github.com/kushsingh1120kk/get-top-marks-shiksha-setu.git

# Navigate to project
cd get-top-marks-shiksha-setu

# Get dependencies
flutter pub get

# Run the app
flutter run
```

## 📁 Project Structure

```
lib/
├── main.dart
├── screens/
│   ├── home_screen.dart
│   ├── subject_screen.dart
│   ├── chapter_screen.dart
│   └── pdf_viewer_screen.dart
├── models/
│   └── subject_model.dart
├── widgets/
│   ├── search_bar.dart
│   ├── subject_card.dart
│   └── bookmark_widget.dart
├── services/
│   ├── pdf_service.dart
│   └── storage_service.dart
└── utils/
    └── constants.dart
```

## 🔨 Building

### APK Build
```bash
flutter build apk --release
```

### AAB Build (Play Store)
```bash
flutter build appbundle --release
```

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 👨‍💻 Author

- **Kush Singh** - [@kushsingh1120kk](https://github.com/kushsingh1120kk)

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📞 Support

For support, email: kushsingh@example.com or create an issue on GitHub.

## 🙏 Acknowledgments

- Flutter Community
- Google Fonts
- CBSE Board
