class ReadingModes {
  bool? text;
  bool? image;

  ReadingModes({this.text, this.image});

  @override
  String toString() => 'ReadingModes(text: $text, image: $image)';

  factory ReadingModes.fromJson(Map<String, dynamic> json) => ReadingModes(
        text: json['text'] as bool?,
        image: json['image'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'text': text,
        'image': image,
      };

  ReadingModes copyWith({
    bool? text,
    bool? image,
  }) {
    return ReadingModes(
      text: text ?? this.text,
      image: image ?? this.image,
    );
  }
}
