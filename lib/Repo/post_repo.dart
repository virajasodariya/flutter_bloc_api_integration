import 'dart:convert';

import 'package:flutter_bloc_api_integration/Api/api_handlers.dart';
import 'package:flutter_bloc_api_integration/Api/base_url.dart';
import 'package:flutter_bloc_api_integration/Model/post_response_model.dart';

class PostRepo {
  static Future<List<PostResponseModel>> getPost() async {
    String url = EndPoints.posts;

    var response = await APIService().getResponse(
      url: url,
      apitype: APIType.aGet,
    );

    /// when data are in List so define this style
    /// only use when data in list
    List<PostResponseModel> responseModel =
        postResponseModelFromJson(jsonEncode(response));

    return responseModel;
  }
}
