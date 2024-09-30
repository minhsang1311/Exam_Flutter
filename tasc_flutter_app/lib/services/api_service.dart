import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/place_model.dart';

class ApiService {
  final String baseUrl = 'http://localhost:8080/api'; // Replace with your server URL

  Future<List<Place>> getAllPlaces() async {
    final response = await http.get(Uri.parse('$baseUrl/getAllPlace'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((place) => Place.fromJson(place)).toList();
    } else {
      throw Exception('Failed to load places');
    }
  }
}
