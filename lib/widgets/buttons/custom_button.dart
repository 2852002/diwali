import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool fullWidth; 

  CustomButton({
    required this.text,
    required this.onPressed,
    this.fullWidth = false, 
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: fullWidth ? double.infinity : null, 
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange, // Button color
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0), 
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
