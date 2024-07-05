import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import './firebase_options.dart'; // Import the Firebase options file

import 'screens/dashboard/dashboard_screen.dart';
import 'screens/weather/weather_screen.dart';
import 'screens/farm/farm_screen.dart';
import 'screens/camera/camera_screen.dart';
import 'screens/my_account/my_account_screen.dart';
import 'screens/camera/upload_screen.dart'; // Import the new upload screen
import 'screens/camera/camera_capture_screen.dart'; // Import the new camera capture screen
import 'login_screen.dart';
import 'welcome_screen.dart';
import 'register.dart'; // Import the register screen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseOptions); // Initialize Firebase with options
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/register', // Set the initial route to '/register'
      routes: {
        '/': (context) => WelcomeScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(), // Ensure RegisterScreen route is properly defined
        '/dashboard': (context) => DashboardScreen(),
        '/weather': (context) => WeatherScreen(),
        '/farm': (context) => FarmScreen(),
        '/camera': (context) => CameraScreen(),
        '/my_account': (context) => MyAccountScreen(),
        '/upload': (context) => UploadScreen(), // Add route for UploadScreen
        '/camera_capture': (context) => CameraCaptureScreen(), // Add route for CameraCaptureScreen
      },
    );
  }
}
