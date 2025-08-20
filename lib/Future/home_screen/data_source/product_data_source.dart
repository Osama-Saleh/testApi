import 'package:dio/dio.dart';
import 'package:ict_hub_api/core/models/product_model/product_model.dart';

class ProductDataSource {
  static final dio = Dio();

  static Future<List<ProductModel>> getProduct() async {
    try {
      List<ProductModel> prodctList = [];
      var response = await dio.get('https://fakestoreapi.com/products');
      if (response.statusCode == 200) {
        List finalRspose = response.data;
        for (var item in finalRspose) {
          final prod = ProductModel.fromJson(item);
          prodctList.add(prod);
        }
        return prodctList;
      } else {
        print('can\'t fetch data');
        return [];
      }
    } catch (e) {
      print('Error ${e.toString()}');
      return [];
    }
  }
}
