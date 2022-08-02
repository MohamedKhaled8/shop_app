import 'package:http/http.dart' as http;
import 'package:st/utils/my_constant.dart';

import '../model/category_model.dart';
import '../model/models_prudects.dart';

class CategoryServices {
  static Future<List<String>> getCategory() async {
    var response = await http.get(Uri.parse('$baseUrl/products/categories'));

    if (response.statusCode == 200) {
      var jsonDatat = response.body;
      return categoryModelFromJson(jsonDatat);
    } else {
      return throw Exception("Failed to Loading...... product");
    }
  }
}


class AllCategorySercvises {
  static Future<List<PrudectsModels>> getAllCatehory(String categoryNames) async {
    var response =
        await http.get(Uri.parse('$baseUrl/products/category/$categoryNames'));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return prudectsModelsFromJson(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
  }
}


//prudectsModelsFromJson