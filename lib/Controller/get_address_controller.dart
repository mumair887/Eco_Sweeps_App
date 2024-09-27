import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import '../Constants/api_url.dart';
import '../Models/get_adress.dart';

Future<List<Address>> fetchAddresses() async {
  final response =
      await http.get(Uri.parse("${APIUrls.baseUrl}${APIUrls.getAddress}"));

  if (response.statusCode == 200) {
    log('get address successfully');

    List<dynamic> data = json.decode(response.body)['data'];
    return data.map((addressJson) => Address.fromJson(addressJson)).toList();
  } else {
    throw Exception('Failed to load addresses');
  }
}
