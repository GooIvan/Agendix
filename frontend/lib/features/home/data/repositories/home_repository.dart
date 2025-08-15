import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../global/api.dart';
import '../../../../models/category.dart';

class HomeRepository {
  Future<List<Category>> fetchCategories() async {
    final response =
        await http.get(Uri.parse('${Api.baseUrl}/categories'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Category.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar categorías');
    }
  }
}