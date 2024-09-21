import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widgets/buttons/custom_button.dart';
import '../admin/admin_screen.dart';
import '../auth/admin_login_screen.dart';
import '../client/client_screen.dart';

class ChooseScreen extends StatelessWidget {
    Future<void> _checkAdminLogin(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isAdminLoggedIn = prefs.getBool('isAdminLoggedIn') ?? false;

    if (isAdminLoggedIn) {
      // Navigate to AdminAddScreen if admin is already logged in
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AdminAddScreen()),
      );
    } else {
      // Navigate to AdminLoginScreen if not logged in
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AdminLoginScreen()),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background with blur effect
          Positioned.fill(
            child: Stack(
              children: [
                // Background image
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/choose_page_image.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Blurred background
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                  child: Container(
                    color: Colors.black.withOpacity(0.5), 
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 30), 
                 
                      Text(
                        "BIG",
                        style: TextStyle(
                          fontFamily: 'Lalezar',
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "DIWALI",
                        style: TextStyle(
                          fontFamily: 'Lalezar',
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "SALE",
                        style: TextStyle(
                          fontFamily: 'Lalezar',
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                // Bottom-centered text and buttons
                Expanded(
                  flex: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: CustomButton(
                          text: 'Client',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ClientScreen()),
                            );
                          },
                        ),
                      ),
                      TextButton(
                  
                            onPressed: () {
                    _checkAdminLogin(context); // Check if admin is logged in
                  },
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => AdminLoginScreen()),
                          // );
                        child: Text(
                          "Admin",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                            decorationThickness: 2,
                            fontFamily: 'Lato',
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "FESTIVAL OF LIGHT",
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '\u00A9 ', 
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(
                          text: 'Powered by ',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 12,
                            color: Colors.white38,
                          ),
                        ),
                        TextSpan(
                          text: 'APS Technologies',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 12,
                            fontWeight: FontWeight.bold, 
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
