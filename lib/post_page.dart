import 'package:bettyskitchen_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

import 'package:cached_network_image/cached_network_image.dart';

class PostPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final double _appBarHeight = 256.0;
  final Post post;

  PostPage({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String image = post.postThumbUrl();
    return new Scaffold(
      key: _scaffoldKey,
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            expandedHeight: _appBarHeight,
            pinned: true,
            floating: false,
            snap: false,
            actions: <Widget>[
               new IconButton(icon: new Icon(Icons.share), onPressed: _onSharePressed)
            ],
            flexibleSpace: new FlexibleSpaceBar(
              title: new Text(
                post.shortTitle,
                overflow: TextOverflow.fade,
                softWrap: true,
              ),
              background: new Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  new CachedNetworkImage(
                    imageUrl: image,
                    placeholder: const CircularProgressIndicator(),
                    errorWidget: new Icon(Icons.error),
                    fadeInDuration: new Duration(milliseconds: 500),
                    fadeOutDuration: new Duration(seconds: 1),
                    height: _appBarHeight,
                    fit: BoxFit.cover,
                  ),
                  // This gradient ensures that the toolbar icons are distinct
                  // against the background image.
                  const DecoratedBox(
                    decoration: const BoxDecoration(
                      gradient: const LinearGradient(
                        begin: const FractionalOffset(0.5, 0.0),
                        end: const FractionalOffset(0.5, 0.30),
                        colors: const <Color>[
                          const Color(0x60000000),
                          const Color(0x00000000)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          new SliverList(
              delegate: new SliverChildListDelegate(<Widget>[
            new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Text(post.content.rendered)),
          ])),
        ],
      ),
    );
  }

  void _onSharePressed() {
    share("Moet je dit recept een proberen ${post.link}");
  }
}

class PostPageRoute extends MaterialPageRoute<Post> {
  final Post post;

  PostPageRoute(
      {this.post,
      WidgetBuilder builder,
      RouteSettings settings: const RouteSettings()})
      : super(builder: builder, settings: settings);

  @override
  Post get currentResult => post;

  static PostPageRoute of(BuildContext context, Post post) => new PostPageRoute(
      post: post,
      builder: (BuildContext context) {
        return new PostPage(
          post: post,
        );
      });
}
