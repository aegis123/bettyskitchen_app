library json_serializable.models;

import 'package:json_annotation/json_annotation.dart';


part 'models.g.dart';

@JsonSerializable()
class Post extends Object with _$PostSerializerMixin {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'title')
  final Rendered title;
  @JsonKey(name: 'content')
  final Rendered content;
  @JsonKey(name: 'excerpt')
  final Rendered excerpt;
  @JsonKey(name: 'link')
  final String link;
  @JsonKey(name: '_embedded', includeIfNull: false, nullable: true)
  final PostEmbedded embedded;

  Post(this.id, this.title, this.content, this.excerpt, this.link,
      this.embedded);

  String get shortTitle => title._rendered.substring(0, 18)+'…';

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}

@JsonSerializable()
class Rendered extends Object with _$RenderedSerializerMixin {
  @JsonKey(name: 'rendered')
  final String _rendered;

  Rendered(this._rendered);

  factory Rendered.fromJson(Map<String, dynamic> json) =>
      _$RenderedFromJson(json);

  String get rendered => _rendered;
}

@JsonSerializable(includeIfNull: false)
class PostEmbedded extends Object with _$PostEmbeddedSerializerMixin {
  @JsonKey(name: 'wp:featuredmedia', includeIfNull: false, nullable: true)
  final List<ImageMedia> _featuredMedias;
  @JsonKey(name: 'author', includeIfNull: false, nullable: true)
  final List<Author> _authors;

  PostEmbedded(this._featuredMedias, this._authors);

  factory PostEmbedded.fromJson(Map<String, dynamic> json) =>
      _$PostEmbeddedFromJson(json);

  List<Author> get authors => _authors;

  List<ImageMedia> get featuredMedias => _featuredMedias;
}

@JsonSerializable()
class ImageMedia extends Object with _$ImageMediaSerializerMixin {
  @JsonKey(name: 'id')
  final int _id;
  @JsonKey(name: 'title')
  final Rendered _title;
  @JsonKey(name: 'alt_text')
  final String _altText;
  @JsonKey(name: 'mime_type')
  final String _mimeType;
  @JsonKey(name: 'media_type')
  final String _mediaType;
  @JsonKey(name: 'media_details', includeIfNull: false, nullable: true)
  final MediaDetails _mediaDetails;

  ImageMedia(this._id, this._title, this._altText, this._mimeType, this._mediaType,
      this._mediaDetails);

  factory ImageMedia.fromJson(Map<String, dynamic> json) => _$ImageMediaFromJson(json);

  MediaDetails get mediaDetails => _mediaDetails;

  String get mediaType => _mediaType;

  String get mimeType => _mimeType;

  String get altText => _altText;

  Rendered get title => _title;

  int get id => _id;
}

@JsonSerializable()
class MediaDetails extends Object with _$MediaDetailsSerializerMixin {
  @JsonKey(name: 'width')
  final int _width;
  @JsonKey(name: 'height')
  final int _height;
  @JsonKey(name: 'file')
  final String _file;
  @JsonKey(name: 'sizes', includeIfNull: false, nullable: true)
  final Sizes _sizes;

  MediaDetails(this._width, this._height, this._file, this._sizes);

  factory MediaDetails.fromJson(Map<String, dynamic> json) =>
      _$MediaDetailsFromJson(json);

  String get file => _file;

  int get height => _height;

  int get width => _width;

  Sizes get sizes => _sizes;
}

@JsonSerializable()
class Sizes extends Object with _$SizesSerializerMixin {
  @JsonKey(name: 'thumbnail', includeIfNull: false, nullable: true)
  final Size _thumbnail;
  @JsonKey(name: 'medium', includeIfNull: false, nullable: true)
  final Size _medium;
  @JsonKey(name: 'large', includeIfNull: false, nullable: true)
  final Size _large;
  @JsonKey(name: 'horizontalThumbnail', includeIfNull: false, nullable: true)
  final Size _horizontalThumbnail;
  @JsonKey(name: 'full', includeIfNull: false, nullable: true)
  final Size _full;
  @JsonKey(name: 'slider', includeIfNull: false, nullable: true)
  final Size _slider;

  Sizes(this._thumbnail, this._medium, this._large, this._horizontalThumbnail,
      this._full, this._slider);

  factory Sizes.fromJson(Map<String, dynamic> json) => _$SizesFromJson(json);

  Size get full => _full;

  Size get horizontalThumbnail => _horizontalThumbnail;

  Size get large => _large;

  Size get medium => _medium;

  Size get thumbnail => _thumbnail;

  Size get slider => _slider;

}

@JsonSerializable()
class Size extends Object with _$SizeSerializerMixin {
  @JsonKey(name: 'width')
  final int _width;
  @JsonKey(name: 'height')
  final int _height;
  @JsonKey(name: 'file')
  final String _file;
  @JsonKey(name: 'mime_type')
  final String _mimeType;
  @JsonKey(name: 'source_url')
  final String _sourceUrl;

  Size(this._width, this._height, this._file, this._mimeType, this._sourceUrl);

  factory Size.fromJson(Map<String, dynamic> json) => _$SizeFromJson(json);

  String get sourceUrl => _sourceUrl;

  String get mimeType => _mimeType;

  String get file => _file;

  int get height => _height;

  int get width => _width;
}

@JsonSerializable()
class Author extends Object with _$AuthorSerializerMixin {
  @JsonKey(name: 'id')
  final int _id;
  @JsonKey(name: 'name')
  final String _name;
  @JsonKey(name: 'description')
  final String _description;
  @JsonKey(name: 'link')
  final String _link;
  @JsonKey(name: 'avatar_urls', includeIfNull: false, nullable: true)
  final Avatars _avatar;

  Author(this._id, this._name, this._description, this._link, this._avatar);

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

  Avatars get avatar => _avatar;

  String get link => _link;

  String get description => _description;

  String get name => _name;

  int get id => _id;
}

@JsonSerializable()
class Avatars extends Object with _$AvatarsSerializerMixin {
  @JsonKey(name: '24')
  final String _small;
  @JsonKey(name: '48')
  final String _medium;
  @JsonKey(name: '96')
  final String _large;

  Avatars(this._small, this._medium, this._large);

  factory Avatars.fromJson(Map<String, dynamic> json) =>
      _$AvatarsFromJson(json);

  Uri get large => Uri.parse(_large);

  Uri get medium => Uri.parse(_medium);

  Uri get small => Uri.parse(_small);
}

@JsonSerializable()
class PostList extends Object with _$PostListSerializerMixin {
  final List<Post> posts;

  PostList(this.posts);

  factory PostList.fromJson(Map<String, dynamic> json) =>
      _$PostListFromJson(json);
}
