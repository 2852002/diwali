import 'package:flutter/material.dart';

class CustomDialogBox extends StatelessWidget {
  final String title;
  final String content;
  final String buttonText;
  final VoidCallback onOkPressed; // Optional callback for when the button is pressed
  final bool preventBackPress; // To prevent dialog from closing via the back button

  CustomDialogBox({
    required this.title,
    required this.content,
    required this.buttonText,
    required this.onOkPressed,
    this.preventBackPress = true, // Default to true (disable back press)
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => !preventBackPress, // Control back button behavior
      child: AlertDialog(
        backgroundColor: Colors.white,
        title: Text(title, style: TextStyle(color: Colors.black)), // Customizable title
        content: Text(content, style: TextStyle(color: Colors.black)), // Customizable content
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Color.fromARGB(255, 255, 179, 38), // Border color
            width: 1.0, // Border width
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        insetPadding: EdgeInsets.symmetric(horizontal: 50, vertical: 24),
        actions: [
          TextButton(
            child: Text(buttonText, style: TextStyle(color: Color.fromARGB(255, 255, 179, 38))),
            onPressed: () {
              onOkPressed(); // Trigger callback
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
        ],
      ),
    );
  }
}
