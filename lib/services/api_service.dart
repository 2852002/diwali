import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api.config.dart';

class ApiService {
  Future<bool> submitData({
    required String mobileNo,
    required String billNumber,
    required String value,
  }) async {
    final url = Uri.parse('${ApiConfig.baseUrl}${ApiConfig.addNewBillDetails}');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'mNo': mobileNo,
          'billNo': billNumber,
          'billValue': value,
        }),
      );

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }

  Future<List<String>> getBillNumbers(String mobileNo) async {
    final url = Uri.parse('${ApiConfig.baseUrl}${ApiConfig.getBillNumbers}/$mobileNo');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final responseBody = response.body;
        if (responseBody.startsWith('[') && responseBody.endsWith(']')) {
          final billNumbers =
              responseBody.substring(1, responseBody.length - 1).split(',');
          return billNumbers.map((e) => e.trim()).toList();
        } else {
          return [responseBody];
        }
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  Future<String> getPinResponse(String mobileNo) async {
    final url = Uri.parse('${ApiConfig.baseUrl}${ApiConfig.getTotalValue}/$mobileNo');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Failed to load PIN response');
      }
    } catch (error) {
      throw Exception('Failed to load PIN response');
    }
  }

  Future<void> addUser(
      String mobileNo, String firstName, String lastName, String address) async {
    final url = Uri.parse('${ApiConfig.baseUrl}${ApiConfig.addUser}');

    final body = {
      "mNo": mobileNo,
      "firstName": firstName,
      "lastName": lastName,
      "address": address,
    };

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );
      if (response.statusCode == 201) {
        // Handle success if needed
      } else {
        // Handle failure
      }
    } catch (e) {
      // Handle error
    }
  }
}
