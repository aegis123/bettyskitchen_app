import 'dart:convert';

import 'package:bettyskitchen_app/models/models.dart';
import 'package:http/http.dart';

class ApiClient {
  final Client httpClient;
  final JsonDecoder decoder;

  ApiClient({this.httpClient, this.decoder});

  getPosts() async {
    final Uri uri = Uri.parse('https://bettyskitchen.nl/wp-json/wp/v2/posts?_embed');
    final Response response =
        await httpClient.get(uri, headers: {"Accept": "application/json"});
    List<Map> list = decoder.convert(response.body);
    final List<Post> posts = new List();
    list.forEach((map) {
      Post post = new Post.fromJson(map);
      posts.add(post);
    });
    return posts;
  }
}
