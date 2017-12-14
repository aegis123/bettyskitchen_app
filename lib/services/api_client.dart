import 'dart:async';
import 'dart:convert';

import 'package:bettyskitchen_app/models/models.dart';
import 'package:http/http.dart';

class ApiClient {
  final Client httpClient;
  final JsonDecoder decoder;

  const ApiClient({this.httpClient, this.decoder});

  Future<List<Post>> _getPostsFromUris({Uri uri}) async {
    final Response response =
        await httpClient.get(uri, headers: {"Accept": "application/json"});

    return decoder
        .convert(response.body)
        .map((map) => new Post.fromJson(map))
        .toList();
  }

  Future<List<Post>> getPosts() async {
    final Uri uri =
        Uri.parse('https://bettyskitchen.nl/wp-json/wp/v2/posts?_embed');
    return _getPostsFromUris(uri: uri);
  }

  Future<List<Post>> getPostsForPage({int page}) async {
    final Uri uri = Uri.parse(
        "https://bettyskitchen.nl/wp-json/wp/v2/posts?_embed&page=$page");
    return _getPostsFromUris(uri: uri);
  }
}
