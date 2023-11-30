import 'package:flutter_bloc_api_integration/Api/api_handlers.dart';
import 'package:flutter_bloc_api_integration/Api/base_url.dart';
import 'package:flutter_bloc_api_integration/Model/product_response_model.dart';

class ProductRepo {
  static Future<ProductResponseModel> getProduct() async {
    String url = EndPoints.products;

    var response = await APIService().getResponse(
      url: url,
      apitype: APIType.aGet,
    );

    ProductResponseModel responseModel =
        ProductResponseModel.fromJson(response);

    return responseModel;
  }
}
