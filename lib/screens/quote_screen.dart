import 'package:flutter/material.dart';
import '../models/quote.dart'; // Importing the Quote model

// QuoteScreen is a StatelessWidget that displays detailed information about a quote
class QuoteScreen extends StatelessWidget {
  final Quote quote; // The quote to be displayed

  // Constructor to initialize the quote
  const QuoteScreen({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Quote Details")), // AppBar with title
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding around the content
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Center content vertically
          crossAxisAlignment:
              CrossAxisAlignment.center, // Center content horizontally
          
          children: [
            
            Center(child:
            // Display the author's image with rounded corners
            ClipRRect(
              borderRadius: BorderRadius.circular(10), // Rounded corners
              child: Image.asset(
                quote.image, // Image path from the quote
                width: 200, // Fixed width
                height: 200, // Fixed height
                fit: BoxFit.cover, // Ensure the image covers the area
              ),
            ),
            ),
            const SizedBox(height: 20), // Spacing between widgets
            // Display the quote text
            Center(child:
            Text(
              quote.text,
              textAlign: TextAlign.center, // Center-align the text
              style: const TextStyle(
                  fontSize: 22, // Larger font size
                  fontWeight: FontWeight.bold, // Bold text
                  fontStyle: FontStyle.italic), // Italic text
            ),),
            const SizedBox(height: 10), // Spacing between widgets
            // Display the author's name
            Center(child:
            Text(
              "- ${quote.author}", // Author's name with a dash
              style: const TextStyle(
                  fontSize: 18, // Medium font size
                  fontWeight: FontWeight.w600, // Semi-bold text
                  color: Color.fromARGB(255, 59, 59, 59)), // Blue accent color
            ),),
            const SizedBox(height: 20), // Spacing between widgets
            // Display additional details about the quote
            Center(child:
            Text(
              quote.details,
              textAlign: TextAlign.center, // Center-align the text
              style: const TextStyle(
                  fontSize: 16, // Standard font size
                  color: Colors.black54), // Slightly faded text color
            ),),
          ],
          )
        ),
      );
  }
}
