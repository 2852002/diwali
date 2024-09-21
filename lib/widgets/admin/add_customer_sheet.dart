import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../services/api_service.dart';
import '../../validators/validators.dart'; // Ensure this import is correct
import '../alertdialog/alert_dialog.dart'; // Ensure this import is correct
import '../textfield/custom_input_field.dart'; // Ensure this import is correct
import '../buttons/custom_button.dart'; // Ensure this import is correct

class AddCustomerBottomSheet extends StatefulWidget {
  @override
  _AddCustomerBottomSheetState createState() => _AddCustomerBottomSheetState();
}

class _AddCustomerBottomSheetState extends State<AddCustomerBottomSheet> {
  final TextEditingController _mobileNoController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final ApiService _apiService = ApiService();
  
  bool _isLoading = false; // To track loading state

  Future<void> _saveCustomer() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true; // Start loading
      });

      try {
        await _apiService.addUser(
          _mobileNoController.text,
          _firstNameController.text,
          _lastNameController.text,
          _addressController.text,
        );
  showDialog(
        context: context,
        builder: (context) => CustomDialogBox(
          title: 'Success',
          content: 'Data Saved Successfully',
          buttonText: 'OK',
          onOkPressed: () {
            // Navigator.of(context).pop(); // Close the dialog
          },
        ),
      );
        _mobileNoController.clear();
        _firstNameController.clear();
        _lastNameController.clear();
        _addressController.clear();

      } catch (e) {
        // Handle error, possibly show an error dialog
      } finally {
        setState(() {
          _isLoading = false; // Stop loading
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // The main content of the bottom sheet
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Add Customer',
                        style: TextStyle(fontSize: 20, color: Colors.white,
                        fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  AdminCustomTextField(
                    label: 'Mobile Number',
                    controller: _mobileNoController,
                    validator: Validators.validateMobileNumber,
                     inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                ], 
                  ),
                  AdminCustomTextField(
                    label: 'First Name',
                    controller: _firstNameController,
                    validator: Validators.validateFirstName,
                  ),
                  AdminCustomTextField(
                    label: 'Last Name',
                    controller: _lastNameController,
                    validator: Validators.validateLastName,
                  ),
                  AdminCustomTextField(
                    label: 'Address',
                    controller: _addressController,
                    validator: Validators.validateAddress,
                  ),
                  SizedBox(height: 20),
                  CustomButton(
                    text: 'Save',
                    onPressed: _saveCustomer,
                    fullWidth: true,
                  ),
                ],
              ),
            ),
          ),
        ),
        // Loading indicator
        if (_isLoading)
          Positioned.fill(
            child: Container(
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white), // White loader
                ),
              ),
            ),
          ),
      ],
    );
  }
}
