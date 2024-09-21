import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import '../../widgets/admin/admin_bottom_sheet.dart';
import '../logout/logout.dart';

class AdminAddScreen extends StatefulWidget {
  @override
  State<AdminAddScreen> createState() => _AdminAddScreenState();
}
 Future<bool> _exitpop(BuildContext context) async {
    bool? logoutConfirmed = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Exit',style: TextStyle(color: Colors.black),),
          content: const Text('Are you sure you want to exit?',style: TextStyle(color: Colors.black)),
           shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Color.fromARGB(255, 255, 179, 38), // Border color
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
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('No'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color.fromARGB(255, 255, 179, 38),
              ),
              onPressed: () {
                SystemNavigator.pop();
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );

    if (logoutConfirmed == true) {
      SystemNavigator.pop();
    }
    return logoutConfirmed ?? false;
  }

class _AdminAddScreenState extends State<AdminAddScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      
         onWillPop: () => _exitpop(context),
      
      child: Scaffold(
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
              // left: 16, // Adjust left position as needed
               right: 16,
              child: TextButton(
                onPressed: () =>  showLogoutDialog(context),
                child: Text(
                  'Logout',
                  style: TextStyle(
                    color: Color.fromARGB(
                        255, 255, 179, 38), // Red color for text
                    fontSize: 20,
                    decoration: TextDecoration.underline, // Underline text
                    decorationColor: Color.fromARGB(255, 255, 179, 38),
                    decorationThickness: 1,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: Opacity(
                    opacity: 0.75, // Adjust opacity as needed
                      //  color: Colors.white
                    // .withOpacity(0),
                    child: AdminBottomSheet(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
