# Weather_app
WeatherApp is a simple and efficient weather app that provides real-time weather information. Powered by a reliable API, the app gives you instant access to the current weather conditions for your location.

Key Features:

Current Weather: See the latest temperature in your area, updated in real-time.
Wind Speed: Stay informed about wind conditions, including speed and direction.
Humidity Levels: Get details on the current humidity to better understand the atmosphere.
Additional Metrics: Access other vital weather data like air pressure and visibility.
WeatherApp is designed for those who want straightforward and quick access to essential weather information, without the clutter.
How to Run:-
This guide will walk you through the steps required to run the Flutter app on your local machine.

Prerequisites
Before you begin, make sure you have the following installed:

Flutter SDK

Download and install the Flutter SDK from the official Flutter website.
Ensure the flutter/bin directory is added to your system’s PATH.
Dart SDK

The Dart SDK comes bundled with the Flutter SDK. No separate installation is needed.
Android Studio (for Android development)

Download and install Android Studio.
Ensure you have the latest Android SDK and an Android device/emulator set up.
Xcode (for iOS development on macOS)

Download and install Xcode from the App Store.
Make sure to set up an iOS device or simulator.
Visual Studio Code or Android Studio (IDE)

You can use either Visual Studio Code with the Flutter extension or Android Studio with Flutter and Dart plugins installed.
A device or emulator

Ensure you have an Android or iOS device connected or an emulator/simulator running.
Steps to Run the App
1. Clone the Repository
First, clone the app's repository to your local machine
cd WeatherApp
2. Install Dependencies
Before running the app, you'll need to install the necessary dependencies:
flutter pub get
3. Run the App
On Android:
Ensure an Android device/emulator is connected and running, then execute:
flutter run
On iOS (macOS only):
Ensure an iOS device/simulator is connected and running, then execute:
flutter run
4. Additional Commands
Run on a specific device:
List available devices and run on a specific one:
flutter devices
flutter run -d <device_id>
Run in release mode:
To build and run the app in release mode (optimized for production):
flutter run --release
5. Troubleshooting
If you encounter any issues, run:
flutter doctor
This command will display information about your Flutter installation and environment. It can help you identify and fix issues.
As of right now the app will show the weather of chandigarh if you want to change it just change the city name to to your desired city in weatherscreen.dart file

