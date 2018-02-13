import 'dart:convert';

import 'package:bettyskitchen_app/models/models.dart';
import 'package:bettyskitchen_app/post_page.dart';
import 'package:bettyskitchen_app/services/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  static const APP_NAME = "Betty's Kitchen";

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: APP_NAME,
      theme: new ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.green.shade500,
          accentColor: Colors.pinkAccent),
      home: const MyHomePage(title: APP_NAME),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key key, this.title}) : super(key: key);

  @override
  MyHomePageState createState() => new MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final ApiClient client =
      new ApiClient(httpClient: createHttpClient(), decoder: new JsonDecoder());
  final List<Post> _data = new List();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    client.getPosts().then((posts) {
      setState(() {
        _isLoading = false;
        _data.addAll(posts);
      });
    });
  }

  _getPosts() async {
    client.getPosts().then((posts) {
      setState(() {
        _isLoading = false;
        _data.insertAll(_data.length, posts);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: _isLoading
          ? const Center(child: const CircularProgressIndicator())
          : new RefreshIndicator(
              child: new ListView.builder(
                itemBuilder: _itemBuilder,
                itemCount: _data.length,
              ),
              onRefresh: _getPosts,
            ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    var post = _data[index];
    return new PostCardWidget(post);
  }
}

class PostCardWidget extends StatelessWidget {
  final Post post;

  const PostCardWidget(this.post, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new InkWell(
        child: new Card(
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Stack(
                children: <Widget>[
                  new Hero(
                      tag: post.postThumbUrl(),
                      child: new CachedNetworkImage(
                        imageUrl: post.postThumbUrl(),
                        placeholder: const CircularProgressIndicator(),
                        errorWidget: new Icon(Icons.error),
                        fadeInDuration: new Duration(milliseconds: 500),
                        fadeOutDuration: new Duration(seconds: 1),
                      )),
                  new Positioned(
                      bottom: 8.0,
                      left: 8.0,
                      child: new Text(
                        post.title.rendered,
                        softWrap: true,
                        overflow: TextOverflow.fade,
                        style: const TextStyle(
                            fontSize: 18.0, color: Colors.white),
                      )),
                ],
              ),
              new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text(post.excerpt.rendered)),
            ],
          ),
        ),
        onTap: () {
          _onCardTapped(context, post);
        },
        highlightColor: Colors.grey,
        splashColor: Colors.blueGrey,
      ),
    );
  }

  void _onCardTapped(BuildContext context, Post post) {
    Navigator.push(context, PostPageRoute.of(context, post));
  }
}
