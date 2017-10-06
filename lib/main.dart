import 'dart:convert';

import 'package:bettyskitchen_app/models/models.dart';
import 'package:bettyskitchen_app/post_page.dart';
import 'package:bettyskitchen_app/services/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

void main() {
  runApp(new MyApp());
}

final ThemeData _themeData = new ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  accentColor: Colors.pinkAccent
);

class MyApp extends StatelessWidget {
  static const APP_NAME = "Betty's Kitchen";

  @override
  Widget build(BuildContext context) {


    return new MaterialApp(
      title: APP_NAME,
      theme: _themeData,
      home: const MyHomePage(title: APP_NAME),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  MyHomePageState createState() => new MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final ApiClient client = new ApiClient();
  final List<Post> _data = new List();

  @override
  void initState() {
    super.initState();
    _getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: new RefreshIndicator(
            child: new ListView.builder(
              itemBuilder: _itemBuilder,
              itemCount: _data.length,
            ),
            onRefresh: _getPosts));
  }

  _getPosts() async {
    final Uri uri = Uri.parse('https://bettyskitchen.nl/wp-json/wp/v2/posts?_embed');
    final Client httpClient = createHttpClient();
    final Response response = await httpClient.get(uri, headers: {"Accept": "application/json"});
    final JsonDecoder decoder = new JsonDecoder();
    final List<Map> list = decoder.convert(response.body);
    final List<Post> tmp = new List();
    list.forEach((map) {
      var post = new Post.fromJson(map);
      tmp.add(post);
    });

    setState(() {
      _data.addAll(tmp);
    });
  }

  Widget _itemBuilder(BuildContext context, int index) {
    var post = _data[index];
    return new PostCardWidget(post: post);
  }
}

class PostCardWidget extends StatefulWidget {
  PostCardWidget({Key key, this.post}) : super(key: key);

  final Post post;

  @override
  PostCardWidgetState createState() => new PostCardWidgetState();
}

class PostCardWidgetState extends State<PostCardWidget> {
  @override
  Widget build(BuildContext context) {
    var image =
        widget.post.embedded.featuredMedias[0].mediaDetails.sizes.slider ??
            widget.post.embedded.featuredMedias[0].mediaDetails.sizes.thumbnail;

    var title = widget.post.title.rendered;
    var excerpt = widget.post.excerpt.rendered;

    return new InkWell(
      child: new Card(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Stack(
              children: <Widget>[
                new Hero(
                    tag: image.sourceUrl,
                    child: new Image.network(image.sourceUrl)
                ),
                new Positioned(
                    bottom: 8.0,
                    left: 8.0,
                    child: new Text(
                      title,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                      style:
                          const TextStyle(fontSize: 18.0, color: Colors.white),
                    )),
              ],
            ),
            new Padding(
                padding: new EdgeInsets.all(8.0), child: new Text(excerpt)),
          ],
        ),
      ),
      onTap: () {
        _onCardTapped(context, widget.post);
      },
      highlightColor: Colors.grey,
      splashColor: Colors.blueGrey,
    );
  }

  void _onCardTapped(BuildContext context, Post post) {
    Navigator.push(context, PostPageRoute.of(context, post));
  }
}
