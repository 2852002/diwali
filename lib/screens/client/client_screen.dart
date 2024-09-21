import 'dart:ui';
import 'package:flutter/material.dart';
import '../../widgets/client/client_bottom_sheet.dart';
import '../logout/logout.dart'; // Import the logout function

class ClientScreen extends StatefulWidget {
  @override
  State<ClientScreen> createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/client_page_image.png"), // Fireworks background image
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 40, // Adjust top position as needed
            left: 16, 
          
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between items
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context); // Navigate to the previous screen
                  },
                ),
              
              ],
            ),
          ),
          // Add the ClientBottomSheet content directly to the container
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Opacity(
                  opacity: 0.75, // Adjust opacity as needed
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: 250), // Set the minimum height
                    child: ClientBottomSheet(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
