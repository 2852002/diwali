import 'package:flutter/material.dart';
import '../../services/api_service.dart';
import '../textfield/custom_input_field.dart'; 
import '../../validators/validators.dart';

class ClientBottomSheet extends StatefulWidget {
  @override
  _ClientBottomSheetState createState() => _ClientBottomSheetState();
}

class _ClientBottomSheetState extends State<ClientBottomSheet> {
  final ApiService _apiService = ApiService();
  final _mobileNoController = TextEditingController();
  List<String> _billNumbers = [];
  String _mobileNo = '';
  String _pinResponse = '10000'; // Initial placeholder value
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _mobileNoController.addListener(_onMobileNumberChanged);
  }

  @override
  void dispose() {
    _mobileNoController.removeListener(_onMobileNumberChanged);
    _mobileNoController.dispose();
    super.dispose();
  }
  void _onMobileNumberChanged() {
    final mobileNo = _mobileNoController.text;

    if (mobileNo.length == 10 && !_isLoading) {
      setState(() {
        _mobileNo = mobileNo;
        _isLoading = true;
      });

      // Perform the API calls
      _fetchData();
    }
  }

  Future<void> _fetchData() async {
    await _getBillNumbers();
    await _getPinResponse();

    setState(() {
      _isLoading = false; 
    });
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Welcome Client',
                style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),
                
              ),
            ),
            SizedBox(height: 16),
            Text(
              'DIWALI DHAMAKA',
              style: TextStyle(
                fontSize: 24,
                // fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _pinResponse.isNotEmpty
                  ? List.generate(
                      _pinResponse.length, (index) => _buildPinBox(index))
                  : List.generate(5, (index) => _buildPinBox(index)),
            ),
            SizedBox(height: 20),
            Form(
              child: AdminCustomTextField(
                label: 'Enter Mobile Number',
                controller: _mobileNoController,
                validator: Validators.validateMobileNumber,
              ),
            ),
            SizedBox(height: 10),
            _isLoading
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  )
                : Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Bill Number',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      _billNumbers.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              itemCount: _billNumbers.length,
                              itemBuilder: (context, index) {
                                return _buildBillNumberCard(
                                    _billNumbers[index]);
                              },
                            )
                          : Container(),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Future<void> _getBillNumbers() async {
    final billNumbers = await _apiService.getBillNumbers(_mobileNo);
    setState(() {
      _billNumbers = billNumbers;
    });
  }

  Future<void> _getPinResponse() async {
    final response = await _apiService.getPinResponse(_mobileNo);
    setState(() {
      _pinResponse = response;
    });
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
            // Check if the index is valid before accessing _pinResponse
            _pinResponse.isNotEmpty ? _pinResponse[index] : '',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildBillNumberCard(String billNumber) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.6),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            billNumber,
            style: TextStyle(fontSize: 20, 
            color: Colors.black,
            fontWeight: FontWeight.w500
           ) ),
        ),
      ),
    );
  }
}
