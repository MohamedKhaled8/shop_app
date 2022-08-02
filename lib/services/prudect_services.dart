import 'package:http/http.dart' as http;
import 'package:st/model/models_prudects.dart';

import '../utils/my_constant.dart';


class ProductServices {
  static Future<List<PrudectsModels>> getProduct() async {
    var response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return prudectsModelsFromJson(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
  }
}