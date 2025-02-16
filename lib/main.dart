import 'package:flutter/material.dart';
import 'screens/home_screen.dart'; // Importing the HomeScreen

// Main function to run the Flutter application
void main() {
  runApp(const QuoteApp()); // Launch the QuoteApp
}

// QuoteApp is the root widget of the application
class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key}); // Constructor for QuoteApp

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Disable the debug banner in the top-right corner
      title: 'Quote App', // Title of the application
      theme: ThemeData(
        primarySwatch: Colors.blue, // Set the primary color theme to blue
      ),
      home: const HomeScreen(), // Set HomeScreen as the default screen
    );
  }
}