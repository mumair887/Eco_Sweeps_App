import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Constants/api_url.dart';

deleteAccount(int userId, context) async {
  final String apiUrl = "${APIREQUEST.baseUrl}${APIREQUEST.deleteAccountUrl}";

  try {
    // Send DELETE request
   final  response = await http.post(
      Uri.parse(apiUrl),
      body: {"user_id": "$userId"},
    );

    if (response.statusCode == 200) {
      log('Account deleted successfully');
      Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
    } else {
      log('Failed to delete account. Status code: ${response.statusCode}');
      log('Response body: ${response.body}');
    }
  } catch (e) {
    log('Error occurred while deleting account: $e');
  }
}
