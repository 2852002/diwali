import 'package:flutter/material.dart';
import 'dart:ui'; // For BackdropFilter
import 'package:shared_preferences/shared_preferences.dart'; // For SharedPreferences
import '../../widgets/buttons/custom_button.dart';

import '../../validators/validators.dart';
import '../admin/admin_screen.dart';

class AdminLoginScreen extends StatefulWidget {
  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isPasswordVisible = false;

void _handleSignIn(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      // Check for hardcoded admin credentials
      if (emailController.text == 'admin@gmail.com' &&
          passwordController.text == 'admin123') {
        // Store login state and credentials in SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isAdminLoggedIn', true);
        await prefs.setString('adminEmail', emailController.text);
        await prefs.setString('adminPassword', passwordController.text);

        // Clear the text fields
        emailController.clear();
        passwordController.clear();

        // Navigate to AdminAddScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AdminAddScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Invalid email or password'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image with blur effect
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/admin_login_image.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 4.0,
                  sigmaY: 4.0), // Blur effect on the background image
              child: Container(
                color: Colors.white.withOpacity(0), // Transparent color to enable the blur
              ),
            ),
          ),

          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    // Glassmorphism Container positioned at the bottom
                    width: double.infinity, // Full width
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2), // Semi-transparent background
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white.withOpacity(0.2)),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1.0), // Additional blur inside the container
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Form(
                          key: _formKey, // Form key to manage validation
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Admin Login',
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontFamily: 'Lato', // Apply Lato font
                                    fontWeight: FontWeight.bold, // Apply bold weight
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(height: 20),
                              // Custom Input Field for Email
                              Text(
                                'Email',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'Lato', // Apply Lato font
                                ),
                              ),
                              SizedBox(height: 8),
                              TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.6),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10), // Uniform circular radius for all corners
                                    borderSide: BorderSide(color: Colors.transparent),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10), // Uniform circular radius for all corners
                                    borderSide: BorderSide(color: Colors.transparent),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10), // Uniform circular radius for all corners
                                    borderSide: BorderSide(color: Colors.transparent),
                                  ),
                                  errorStyle: TextStyle(
                                      color: Colors.black, // Error text color
                                      fontWeight: FontWeight.bold, // Error text bold
                                      fontSize: 14),
                                ),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Lato', // Apply Lato font
                                ),
                                validator: Validators.validateEmail,
                              ),
                              SizedBox(height: 20),

                              // Custom Input Field for Password
                              Text(
                                'Password',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'Lato', // Apply Lato font
                                ),
                              ),
                              SizedBox(height: 8),
                              TextFormField(
                                controller: passwordController,
                                obscureText: !_isPasswordVisible,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.6),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10), // Uniform circular radius for all corners
                                    borderSide: BorderSide(color: Colors.transparent),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10), // Uniform circular radius for all corners
                                    borderSide: BorderSide(color: Colors.transparent),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10), // Uniform circular radius for all corners
                                    borderSide: BorderSide(color: Colors.transparent),
                                  ),
                                  errorStyle: TextStyle(
                                      color: Colors.black, // Error text color
                                      fontWeight: FontWeight.bold, // Error text bold
                                      fontSize: 14),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      color: Colors.white,
                                      _isPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isPasswordVisible = !_isPasswordVisible;
                                      });
                                    },
                                  ),
                                ),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Lato', // Apply Lato font
                                ),
                                validator: Validators.validatePassword,
                              ),

                              SizedBox(height: 20),
                              // Sign In Button
                              CustomButton(
                                text: 'Sign In',
                                onPressed: () => _handleSignIn(context),
                                fullWidth: true, // Full-width button
                              ),
                            ],
                          ),
                        ),
                      ),
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
