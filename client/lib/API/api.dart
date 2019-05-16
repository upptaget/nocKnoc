import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import '../model/user_model.dart';
import '../model/post_model.dart';

import 'package:flutter/foundation.dart';

final _apiEndpoint = 'https://f86e4075.ngrok.io/api/employees';
final _apiExitpoint = 'https://f86e4075.ngrok.io/api/notify';

Future<List<UserModel>> fecthUserList() async {
  http.Response response = await http.get(Uri.encodeFull(_apiEndpoint),
      headers: {"Accept": "application/json"});

  if (response.statusCode != 200) {
    throw Exception('error getting users');
  }

  return compute(parseUsers, response.body);
}

List<UserModel> parseUsers(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<UserModel>((json) => UserModel.fromJSON(json)).toList();
}

Future<Post> createPost({Map body}) async {
  return http.post(_apiExitpoint, body: body).then((http.Response response) {
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    return Post.fromJson(json.decode(response.body));
  });
}
