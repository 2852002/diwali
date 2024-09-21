import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final IconData icon;
  final TextEditingController? controller;

  CustomInputField({required this.label, required this.icon, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        controller: controller,
        style: TextStyle(
            color: Colors.white), 
        decoration: InputDecoration(

          labelText: label,
          labelStyle: TextStyle(
              color:
                  Colors.white), 
          prefixIcon: Icon(icon, color: Colors.orange),
          filled: true,
          fillColor: Colors.white.withOpacity(0.5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular( 10), 
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
                10), 
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular( 10),
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
      ),
    );
  }
}

class AdminCustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function()? onEditingComplete;
  final List<TextInputFormatter>? inputFormatters;

  const AdminCustomTextField({
    required this.label,
    this.controller,
    this.validator, 
    this.onEditingComplete,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: controller,
            style: TextStyle(color: Colors.white),
            onEditingComplete: onEditingComplete,
            validator: validator, // Use validator function
            inputFormatters: inputFormatters,
            decoration: InputDecoration(
              // hintText: hintText,
              hintStyle: TextStyle(color: Colors.white),
              filled: true,
              fillColor: Color(0xFFE4E4E4).withOpacity(0.4),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular( 10),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10), 
                borderSide: BorderSide(color: Colors.transparent),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10), 
                borderSide: BorderSide(color: Colors.transparent),
              ),
              errorStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold, 
                  fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
