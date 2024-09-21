import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../auth/admin_login_screen.dart';

Future<void> _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isAdminLoggedIn', false);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => AdminLoginScreen()),
    );
  }
void showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Confirm Logout",style: TextStyle(color: Colors.black)),
        content: const Text("Are you sure you want to logout?",style: TextStyle(color: Colors.black)),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Color.fromARGB(255, 255, 179, 38), 
            width: 1.0, // Border width
          ),
          borderRadius: BorderRadius.circular(25.0), // Adjust border radius if needed
        ),
        actions: <Widget>[
          ElevatedButton(
             style: ElevatedButton.styleFrom(
                foregroundColor: Color.fromARGB(255, 255, 179, 38),
                backgroundColor: Colors.white,
                // side: BorderSide(
                //   color: Theme.of(context).dividerColor,
                // ),
              ),
            child: const Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color.fromARGB(255, 255, 179, 38),
              ),
            child: const Text("Logout"),
            onPressed: () {
              // Navigator.pushReplacementNamed(context, '/choose'); 
               _logout(context);
              
              // Add your logout logic here
            },
          ),
        ],
      );
    },
  );
}