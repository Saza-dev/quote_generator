// Quote class represents a quote with its associated details
class Quote {
  final String text; // The text of the quote
  final String author; // The author of the quote
  final String image; // The image path associated with the author
  final String details; // Additional details or context about the quote

  // Constructor to initialize a Quote object
  Quote({
    required this.text, // Required parameter for the quote text
    required this.author, // Required parameter for the author's name
    required this.image, // Required parameter for the image path
    required this.details, // Required parameter for additional details
  });
}
