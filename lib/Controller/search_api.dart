import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:service_app/Constants/api_url.dart';
import '../Models/search_model.dart';

class SearchProductsApi extends ChangeNotifier {
  SearchModel? _searchResults;
  bool _isLoading = false;

  SearchModel? get searchResults => _searchResults;
  bool get isLoading => _isLoading;

  // API call to perform search
  Future<SearchModel?> search(String query) async {
    _isLoading = true;
    notifyListeners();

    try {
      final url = "${APIREQUEST.baseUrl}${APIREQUEST.searchapi}";
      final response = await http.post(
        Uri.parse(url),
        body: {
          'query': query,
        },
      );

      if (response.statusCode == 200) {
        log('mesage ${response.body}');
        _searchResults = SearchModel.fromJson(jsonDecode(response.body));
        return _searchResults;
      } else {
        log('dfsfs');
        throw Exception('Failed to load search results');
      }
    } catch (error) {
      log('Error fetching search results: $error');
      return SearchModel();
    }
  }
}
