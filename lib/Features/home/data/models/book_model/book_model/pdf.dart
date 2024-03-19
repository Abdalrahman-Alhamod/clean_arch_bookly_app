class Pdf {
  bool? isAvailable;
  String? acsTokenLink;

  Pdf({this.isAvailable, this.acsTokenLink});

  @override
  String toString() {
    return 'Pdf(isAvailable: $isAvailable, acsTokenLink: $acsTokenLink)';
  }

  factory Pdf.fromJson(Map<String, dynamic> json) => Pdf(
        isAvailable: json['isAvailable'] as bool?,
        acsTokenLink: json['acsTokenLink'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'isAvailable': isAvailable,
        'acsTokenLink': acsTokenLink,
      };

  Pdf copyWith({
    bool? isAvailable,
    String? acsTokenLink,
  }) {
    return Pdf(
      isAvailable: isAvailable ?? this.isAvailable,
      acsTokenLink: acsTokenLink ?? this.acsTokenLink,
    );
  }
}
