import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Constants/api_url.dart';
import '../Models/address_model.dart';

class AddressController extends ChangeNotifier {
  AddressModel? addressModel;

  Future<AddressModel?> postAddress(String houseno, String address,
      String addressDetail, String landMark, int userId) async {
    final String url = "${APIREQUEST.baseUrl}${APIREQUEST.addressDetail}";

    try {
      final res = await http.post(Uri.parse(url), body: {
        "house_no": houseno,
        "address": address,
        "address_detail": addressDetail,
        "landmark": landMark,
        "user_id": "$userId",
        "latitude": "3456543",
        "longitude": "4543321",
      }, headers: {
        "accept": "application/json",
      });

      log("Response from saving address: ${res.body}");
      var myJsonData = jsonDecode(res.body);
      if (res.statusCode == 200) {
        log('sfasfsfsdfsdf$myJsonData');
        // Parse the response body if the status code is 200
        addressModel = AddressModel.fromJson(myJsonData);

        return addressModel!;
      }
    } catch (e) {
      // Log the error and show a toast with the error message
      log('Error occurred while saving address: $e');

      return AddressModel();
    }
    return null;
  }
}
