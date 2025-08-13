import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login_screen_api/model/post_data_model.dart';

class PostAPI {
  static Future<PostDataModel> createPost(Object post) async {
    final url = 'https://jsonplaceholder.typicode.com/posts';
    final response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(post),
    );
    print(response.body);
    if (response.statusCode == 201) {
      return PostDataModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to create post");
    }
  }
}
