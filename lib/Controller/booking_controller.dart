import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:service_app/Constants/api_url.dart';
import '../Models/booking_model.dart';

class BookingResponseController extends ChangeNotifier {
  String bookId = "68";
  Future<BookingResponseModel?> fetchBooking() async {
    String url = "${APIUrls.baseUrl}${APIUrls.bookingApi}$bookId";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      log('Booking confirmed succesfully');
      log("API Response: ${response.body}");
      return BookingResponseModel.fromJson(json.decode(response.body));
    } else {
      log("Failed to load bookinge");

      throw Exception('Failed to load booking');
    }
  }
}
