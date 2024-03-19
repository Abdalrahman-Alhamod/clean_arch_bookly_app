class Epub {
  bool? isAvailable;

  Epub({this.isAvailable});

  @override
  String toString() => 'Epub(isAvailable: $isAvailable)';

  factory Epub.fromJson(Map<String, dynamic> json) => Epub(
        isAvailable: json['isAvailable'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'isAvailable': isAvailable,
      };

  Epub copyWith({
    bool? isAvailable,
  }) {
    return Epub(
      isAvailable: isAvailable ?? this.isAvailable,
    );
  }
}
