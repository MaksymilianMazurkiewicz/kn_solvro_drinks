import 'dart:convert';
import 'package:http/http.dart' as http;


import '../models/api_results.dart';
import '../models/drink/drink.dart';
import '../models/drink/drink_filter.dart';

class DrinksProxyService {
  final String baseUrl = "https://cocktails.solvro.pl/api/v1";

  Future <ApiResult<ExtendDrink>> getDrinkAsync(int drinkID) async {
    Uri url = Uri.parse('$baseUrl/cocktails/$drinkID');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return ApiResult.fromJson(json.decode(response.body), ExtendDrink.fromJson);
    }
    throw Exception("Faild to load list drinks");
  }

  Future <ApiResults<BaseDrink>> getAllAsync(DrinkFilter filter, int? page, int? pageSize) async {
    String stringUrl = '$baseUrl/cocktails?page=${page ?? 1}&perPage=${pageSize ?? 15}';

    if (filter.name != null) {
      stringUrl += '&name=${filter.name}';
    }

    final response = await http.get(Uri.parse(stringUrl));

    if (response.statusCode == 200) {
      return ApiResults.fromJson(json.decode(response.body), BaseDrink.fromJson);
    }
    throw Exception("Faild to load list drinks");
  }
}