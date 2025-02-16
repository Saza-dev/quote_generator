import 'package:flutter/material.dart';
import 'dart:math';
import 'quote_screen.dart'; // Importing the QuoteDetailsScreen
import '../models/quote.dart'; // Importing the Quote model

// HomeScreen is a StatefulWidget that allows users to generate and view quotes
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// State class for HomeScreen
class _HomeScreenState extends State<HomeScreen> {
  String dropdownValue = 'Motivation'; // Default selected category

  // List of available quote categories
  final List<String> categories = [
    'Motivation',
    'Success',
    'Happiness',
    'Life'
  ];

  // Map of quotes categorized by their type
  final Map<String, List<Quote>> quotes = {
    'Motivation': [
      Quote(
        text:
            "Life is like riding a bicycle. To keep your balance, you must keep moving.",
        author: "Albert Einstein",
        image: "images/einstein.jpg",
        details:
            "This quote emphasizes the importance of persistence in life. Albert Einstein, a theoretical physicist, is known for his contributions to relativity.",
      ),
      Quote(
        text:
            "Your time is limited, so don’t waste it living someone else's life.",
        author: "Steve Jobs",
        image: "images/jobs.jpg",
        details:
            "Steve Jobs, co-founder of Apple, believed in following one's own passions rather than conforming to societal expectations.",
      ),
      Quote(
        text: "The only way to do great work is to love what you do.",
        author: "Steve Jobs",
        image: "images/jobs.jpg",
        details:
            "Steve Jobs, co-founder of Apple, believed in following one's own passions rather than conforming to societal expectations.",
      ),
    ],
    'Success': [
      Quote(
        text:
            "Success is not final, failure is not fatal: it is the courage to continue that counts.",
        author: "Winston Churchill",
        image: "images/churchill.jpg",
        details:
            "Churchill, the former UK Prime Minister, highlights the importance of resilience in both success and failure.",
      ),
      Quote(
        text:
            "Success is not the key to happiness. Happiness is the key to success.",
        author: "Albert Schweitzer",
        image: "images/albert.jpg",
        details:
            " Albert Schweitzer, a theologian, philosopher, and physician, believed that true success comes from happiness and inner peace. When you're happy, success follows naturally.",
      ),
      Quote(
        text: "Success is not in what you have, but who you are.",
        author: "Bo Bennett",
        image: "images/bo.jpg",
        details:
            "Success is often thought to be linked to wealth or possessions, but Bo Bennett emphasizes that it's the character and integrity of a person that defines their success.",
      ),
    ],
    'Life': [
      Quote(
          text:
              "In the end, we will remember not the words of our enemies, but the silence of our friends.",
          author: "Martin Luther King Jr.",
          image: "images/martin.jpg",
          details:
              "This powerful statement highlights the importance of support and loyalty from friends, especially in times of struggle. It shows how silence can hurt more than harsh words."),
      Quote(
          text: "Life is 10% what happens to us and 90% how we react to it.",
          author: "Charles R. Swindoll",
          image: "images/charles.jpg",
          details:
              "This quote suggests that our attitude and response to events in life have a far greater impact than the events themselves. We have the power to control our reactions."),
      Quote(
          text:
              "To live is the rarest thing in the world. Most people exist, that is all.",
          author: "Oscar Wilde",
          image: "images/oscar.jpg",
          details:
              "Oscar Wilde challenges us to truly live and experience life rather than just going through the motions. Living fully involves pursuing passions, taking risks, and making the most of every moment."),
    ],
    'Happiness': [
      Quote(
          text: "Happiness depends upon ourselves.",
          author: "Aristotle",
          image: "images/aristotle.jpg",
          details:
              "Aristotle, the ancient Greek philosopher, believed that happiness is a result of how we live and think, not merely a state of being. We control our happiness through our actions and thoughts.")
    ]
  };

  Quote? displayedQuote; // Currently displayed quote

  // Function to generate a random quote
  void generateQuote() {
    final random = Random();
    final quoteList =
        quotes[dropdownValue] ?? []; // Get quotes for the selected category
    if (quoteList.isNotEmpty) {
      setState(() {
        displayedQuote = quoteList[
            random.nextInt(quoteList.length)]; // Select a random quote
      });
    }
  }

  // Function to navigate to the Quote screen
  void navigateToQuoteDetails() {
    if (displayedQuote != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QuoteScreen(
              quote:
                  displayedQuote!), // Pass the displayed quote to the details screen
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Quote Generator")), // AppBar with title
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Select a Category:",
                style: TextStyle(fontSize: 20)), // Category selection text
            const SizedBox(height: 10),

// Dropdown to select a category
            Center(
                child: SizedBox(
                    width: 500,
                    child: DropdownButtonFormField(
                      value: dropdownValue,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      items: categories.map((String category) {
                        return DropdownMenuItem(
                            value: category,
                            child: Text(category,
                                style: const TextStyle(fontSize: 18)));
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!; // Update selected category
                        });
                      },
                    ))),

            const SizedBox(height: 20),


            // Display the generated quote
            if (displayedQuote != null)
            SizedBox(width: 500,
            child: 
              GestureDetector(
                onTap: navigateToQuoteDetails, // Navigate to details on tap
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    displayedQuote!.text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Button to generate a new quote
            ElevatedButton(
              onPressed: generateQuote,
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: const TextStyle(fontSize: 18, color: Colors.black),
              ),
              child: const Text("Generate",style:TextStyle(fontSize: 22, color: Colors.black) ,),
            ),
          ],
        ),
      ),
    );
  }
}
