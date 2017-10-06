// GENERATED CODE - DO NOT MODIFY BY HAND

part of json_serializable.models;

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => new Post(
    json['id'] as int,
    json['title'] == null
        ? null
        : new Rendered.fromJson(json['title'] as Map<String, dynamic>),
    json['content'] == null
        ? null
        : new Rendered.fromJson(json['content'] as Map<String, dynamic>),
    json['excerpt'] == null
        ? null
        : new Rendered.fromJson(json['excerpt'] as Map<String, dynamic>),
    json['link'] as String,
    json['_embedded'] == null
        ? null
        : new PostEmbedded.fromJson(json['_embedded'] as Map<String, dynamic>));

abstract class _$PostSerializerMixin {
  int get id;
  Rendered get title;
  Rendered get content;
  Rendered get excerpt;
  String get link;
  PostEmbedded get embedded;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'id': id,
      'title': title,
      'content': content,
      'excerpt': excerpt,
      'link': link,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('_embedded', embedded);
    return val;
  }
}

Rendered _$RenderedFromJson(Map<String, dynamic> json) =>
    new Rendered(json['rendered'] as String);

abstract class _$RenderedSerializerMixin {
  String get _rendered;
  Map<String, dynamic> toJson() => <String, dynamic>{'rendered': _rendered};
}

PostEmbedded _$PostEmbeddedFromJson(Map<String, dynamic> json) =>
    new PostEmbedded(
        (json['wp:featuredmedia'] as List)
            ?.map((e) => e == null
                ? null
                : new ImageMedia.fromJson(e as Map<String, dynamic>))
            ?.toList(),
        (json['author'] as List)
            ?.map((e) => e == null
                ? null
                : new Author.fromJson(e as Map<String, dynamic>))
            ?.toList());

abstract class _$PostEmbeddedSerializerMixin {
  List<ImageMedia> get _featuredMedias;
  List<Author> get _authors;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{};

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('wp:featuredmedia', _featuredMedias);
    writeNotNull('author', _authors);
    return val;
  }
}

ImageMedia _$ImageMediaFromJson(Map<String, dynamic> json) => new ImageMedia(
    json['id'] as int,
    json['title'] == null
        ? null
        : new Rendered.fromJson(json['title'] as Map<String, dynamic>),
    json['alt_text'] as String,
    json['mime_type'] as String,
    json['media_type'] as String,
    json['media_details'] == null
        ? null
        : new MediaDetails.fromJson(
            json['media_details'] as Map<String, dynamic>));

abstract class _$ImageMediaSerializerMixin {
  int get _id;
  Rendered get _title;
  String get _altText;
  String get _mimeType;
  String get _mediaType;
  MediaDetails get _mediaDetails;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'id': _id,
      'title': _title,
      'alt_text': _altText,
      'mime_type': _mimeType,
      'media_type': _mediaType,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('media_details', _mediaDetails);
    return val;
  }
}

MediaDetails _$MediaDetailsFromJson(Map<String, dynamic> json) =>
    new MediaDetails(
        json['width'] as int,
        json['height'] as int,
        json['file'] as String,
        json['sizes'] == null
            ? null
            : new Sizes.fromJson(json['sizes'] as Map<String, dynamic>));

abstract class _$MediaDetailsSerializerMixin {
  int get _width;
  int get _height;
  String get _file;
  Sizes get _sizes;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'width': _width,
      'height': _height,
      'file': _file,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('sizes', _sizes);
    return val;
  }
}

Sizes _$SizesFromJson(Map<String, dynamic> json) => new Sizes(
    json['thumbnail'] == null
        ? null
        : new Size.fromJson(json['thumbnail'] as Map<String, dynamic>),
    json['medium'] == null
        ? null
        : new Size.fromJson(json['medium'] as Map<String, dynamic>),
    json['large'] == null
        ? null
        : new Size.fromJson(json['large'] as Map<String, dynamic>),
    json['horizontalThumbnail'] == null
        ? null
        : new Size.fromJson(
            json['horizontalThumbnail'] as Map<String, dynamic>),
    json['full'] == null
        ? null
        : new Size.fromJson(json['full'] as Map<String, dynamic>),
    json['slider'] == null
        ? null
        : new Size.fromJson(json['slider'] as Map<String, dynamic>));

abstract class _$SizesSerializerMixin {
  Size get _thumbnail;
  Size get _medium;
  Size get _large;
  Size get _horizontalThumbnail;
  Size get _full;
  Size get _slider;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{};

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('thumbnail', _thumbnail);
    writeNotNull('medium', _medium);
    writeNotNull('large', _large);
    writeNotNull('horizontalThumbnail', _horizontalThumbnail);
    writeNotNull('full', _full);
    writeNotNull('slider', _slider);
    return val;
  }
}

Size _$SizeFromJson(Map<String, dynamic> json) => new Size(
    json['width'] as int,
    json['height'] as int,
    json['file'] as String,
    json['mime_type'] as String,
    json['source_url'] as String);

abstract class _$SizeSerializerMixin {
  int get _width;
  int get _height;
  String get _file;
  String get _mimeType;
  String get _sourceUrl;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'width': _width,
        'height': _height,
        'file': _file,
        'mime_type': _mimeType,
        'source_url': _sourceUrl
      };
}

Author _$AuthorFromJson(Map<String, dynamic> json) => new Author(
    json['id'] as int,
    json['name'] as String,
    json['description'] as String,
    json['link'] as String,
    json['avatar_urls'] == null
        ? null
        : new Avatars.fromJson(json['avatar_urls'] as Map<String, dynamic>));

abstract class _$AuthorSerializerMixin {
  int get _id;
  String get _name;
  String get _description;
  String get _link;
  Avatars get _avatar;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'id': _id,
      'name': _name,
      'description': _description,
      'link': _link,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('avatar_urls', _avatar);
    return val;
  }
}

Avatars _$AvatarsFromJson(Map<String, dynamic> json) => new Avatars(
    json['24'] as String, json['48'] as String, json['96'] as String);

abstract class _$AvatarsSerializerMixin {
  String get _small;
  String get _medium;
  String get _large;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'24': _small, '48': _medium, '96': _large};
}

PostList _$PostListFromJson(Map<String, dynamic> json) =>
    new PostList((json['posts'] as List)
        ?.map((e) =>
            e == null ? null : new Post.fromJson(e as Map<String, dynamic>))
        ?.toList());

abstract class _$PostListSerializerMixin {
  List<Post> get posts;
  Map<String, dynamic> toJson() => <String, dynamic>{'posts': posts};
}
