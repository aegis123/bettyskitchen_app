import 'package:bettyskitchen_app/models/models.dart';
import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final double _appBarHeight = 256.0;
  final Post post;

  PostPage({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var image = post.embedded.featuredMedias[0].mediaDetails.sizes.slider ??
        post.embedded.featuredMedias[0].mediaDetails.sizes.thumbnail;

    return new Scaffold(
      key: _scaffoldKey,
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            expandedHeight: _appBarHeight,
            pinned: true,
            floating: false,
            snap: false,
            flexibleSpace: new FlexibleSpaceBar(
              title: new Text(
                post.shortTitle,
                overflow: TextOverflow.fade,
                softWrap: true,
              ),
              background: new Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  new Image.network(
                    image.sourceUrl,
                    fit: BoxFit.cover,
                    height: _appBarHeight,
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
                padding: new EdgeInsets.all(8.0),
                child: new Text(post.content.rendered)),
          ])),
        ],
      ),
    );
  }
}

class PostPageRoute extends MaterialPageRoute<Post> {
  final Post post;

  PostPageRoute(
      {this.post,
      WidgetBuilder builder,
      RouteSettings settings: const RouteSettings()})
      : assert(post != null),
        super(builder: builder, settings: settings);

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
