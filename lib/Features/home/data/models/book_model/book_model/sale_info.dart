class SaleInfo {
  String? country;
  String? saleability;
  bool? isEbook;

  SaleInfo({this.country, this.saleability, this.isEbook});

  @override
  String toString() {
    return 'SaleInfo(country: $country, saleability: $saleability, isEbook: $isEbook)';
  }

  factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo(
        country: json['country'] as String?,
        saleability: json['saleability'] as String?,
        isEbook: json['isEbook'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'country': country,
        'saleability': saleability,
        'isEbook': isEbook,
      };

  SaleInfo copyWith({
    String? country,
    String? saleability,
    bool? isEbook,
  }) {
    return SaleInfo(
      country: country ?? this.country,
      saleability: saleability ?? this.saleability,
      isEbook: isEbook ?? this.isEbook,
    );
  }
}
