import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../screens/admin/add_customer_screen.dart';
import '../../services/api_service.dart';
import '../alertdialog/alert_dialog.dart'; // Ensure this import is correct
import '../buttons/custom_button.dart';
import '../textfield/custom_input_field.dart'; // Ensure this import is correct
import '../../validators/validators.dart'; // Ensure this import is correct

class AdminBottomSheet extends StatefulWidget {
  const AdminBottomSheet({super.key});

  @override
  _AdminBottomSheetState createState() => _AdminBottomSheetState();
}

class _AdminBottomSheetState extends State<AdminBottomSheet> {
  final TextEditingController _mobileNoController = TextEditingController();
  final TextEditingController _billNumberController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Form key for validation

  String _pinResponse = '10000';
  final ApiService _apiService = ApiService();
  bool _isLoading = false;

  Future<void> _submitData() async {
    if (_formKey.currentState!.validate()) {
      final String mobileNo = _mobileNoController.text;
      final String billNumber = _billNumberController.text;
      final String value = _valueController.text;

      setState(() {
        _isLoading = true;
      });

      try {
        // Fetch pinResponse (it will not be cleared)
        final pinResponse = await _apiService.getPinResponse(mobileNo);

        setState(() {
          _pinResponse = pinResponse;
        });

        final success = await _apiService.submitData(
          mobileNo: mobileNo,
          billNumber: billNumber,
          value: value,
        );

        if (success) {
         showDialog(
          context: context,
          builder: (context) => CustomDialogBox(
            title: 'Success',
            content: 'Data Saved Successfully',
            buttonText: 'OK',
            onOkPressed: () {
              _getPinResponse(mobileNo); // Custom admin action
              // Navigator.of(context).pop(); // Close the dialog
            },
          ),
        );
          _clearTextFields();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to submit data')),
          );
        }
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('An error occurred: $error')),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _getPinResponse(String mobileNo) async {
    final response = await _apiService.getPinResponse(mobileNo);

    setState(() {
      _pinResponse = response;
    });
  }

  void _clearTextFields() {
    _mobileNoController.clear();
    _billNumberController.clear();
    _valueController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                    'Welcome Admin',
                     style: TextStyle(fontSize: 20, color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdminAddCustomerScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Add Customer',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white,
                        decorationThickness: 2,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'DIWALI DHAMAKA',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _pinResponse.isNotEmpty
                    ? List.generate(
                        _pinResponse.length, (index) => _buildPinBox(index))
                    : List.generate(5, (index) => _buildPinBox(index)),
              ),
              SizedBox(height: 20),
              AdminCustomTextField(
                label: 'Enter mobile Number',
                controller: _mobileNoController,
                validator: Validators.validateMobileNumber,
                  inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                ], 
              ),
              AdminCustomTextField(
                label: 'Bill Number',
                controller: _billNumberController,
                validator: Validators.validateBillNumber,
              ),
              AdminCustomTextField(
                label: 'Value',
                controller: _valueController,
                validator: Validators.validateValue,
              ),
              _isLoading
                  ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    )
                  : CustomButton(
                      text: 'Save',
                      onPressed: _submitData,
                      fullWidth: true,
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPinBox(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Container(
        width: 40,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            _pinResponse.isNotEmpty ? _pinResponse[index] : '',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
