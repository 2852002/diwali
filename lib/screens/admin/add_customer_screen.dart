import 'dart:ui';

import 'package:diwali_damaka/widgets/admin/add_customer_sheet.dart';
import 'package:flutter/material.dart';

import '../logout/logout.dart';

class AdminAddCustomerScreen extends StatefulWidget {
  @override
  State<AdminAddCustomerScreen> createState() => _AdminAddCustomerScreenState();
}

class _AdminAddCustomerScreenState extends State<AdminAddCustomerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image covering the full screen
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/client_page_image.png"),
                fit: BoxFit.cover,
              ),
            ),
          
          
          ),
            Positioned(
            top: 40, // Adjust top position as needed
            left: 16, // Adjust left position as needed
            right: 16, // Ensure the row can stretch to the right edge
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between items
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context); // Navigate to the previous screen
                  },
                ),
                TextButton(
                  onPressed: () =>  showLogoutDialog(context),
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      color:  Color.fromARGB(255, 255, 179, 38), // Red color for text
                      fontSize: 20,
                      decoration: TextDecoration.underline, // Underline text
                       decorationColor:  Color.fromARGB(255, 255, 179, 38),
                            decorationThickness: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Opacity(
                  opacity: 0.75, // Adjust opacity as needed
                  child: AddCustomerBottomSheet(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
