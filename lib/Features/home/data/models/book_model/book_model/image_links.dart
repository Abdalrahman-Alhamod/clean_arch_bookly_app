class ImageLinks {
  String? smallThumbnail;
  String? thumbnail;

  ImageLinks({this.smallThumbnail, this.thumbnail});

  @override
  String toString() {
    return 'ImageLinks(smallThumbnail: $smallThumbnail, thumbnail: $thumbnail)';
  }

  factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
        smallThumbnail: json['smallThumbnail'] as String?,
        thumbnail: json['thumbnail'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'smallThumbnail': smallThumbnail,
        'thumbnail': thumbnail,
      };

  ImageLinks copyWith({
    String? smallThumbnail,
    String? thumbnail,
  }) {
    return ImageLinks(
      smallThumbnail: smallThumbnail ?? this.smallThumbnail,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }
}
