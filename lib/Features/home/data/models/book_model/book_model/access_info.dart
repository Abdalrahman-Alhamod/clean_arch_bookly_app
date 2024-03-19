import 'epub.dart';
import 'pdf.dart';

class AccessInfo {
  String? country;
  String? viewability;
  bool? embeddable;
  bool? publicDomain;
  String? textToSpeechPermission;
  Epub? epub;
  Pdf? pdf;
  String? webReaderLink;
  String? accessViewStatus;
  bool? quoteSharingAllowed;

  AccessInfo({
    this.country,
    this.viewability,
    this.embeddable,
    this.publicDomain,
    this.textToSpeechPermission,
    this.epub,
    this.pdf,
    this.webReaderLink,
    this.accessViewStatus,
    this.quoteSharingAllowed,
  });

  @override
  String toString() {
    return 'AccessInfo(country: $country, viewability: $viewability, embeddable: $embeddable, publicDomain: $publicDomain, textToSpeechPermission: $textToSpeechPermission, epub: $epub, pdf: $pdf, webReaderLink: $webReaderLink, accessViewStatus: $accessViewStatus, quoteSharingAllowed: $quoteSharingAllowed)';
  }

  factory AccessInfo.fromJson(Map<String, dynamic> json) => AccessInfo(
        country: json['country'] as String?,
        viewability: json['viewability'] as String?,
        embeddable: json['embeddable'] as bool?,
        publicDomain: json['publicDomain'] as bool?,
        textToSpeechPermission: json['textToSpeechPermission'] as String?,
        epub: json['epub'] == null
            ? null
            : Epub.fromJson(json['epub'] as Map<String, dynamic>),
        pdf: json['pdf'] == null
            ? null
            : Pdf.fromJson(json['pdf'] as Map<String, dynamic>),
        webReaderLink: json['webReaderLink'] as String?,
        accessViewStatus: json['accessViewStatus'] as String?,
        quoteSharingAllowed: json['quoteSharingAllowed'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'country': country,
        'viewability': viewability,
        'embeddable': embeddable,
        'publicDomain': publicDomain,
        'textToSpeechPermission': textToSpeechPermission,
        'epub': epub?.toJson(),
        'pdf': pdf?.toJson(),
        'webReaderLink': webReaderLink,
        'accessViewStatus': accessViewStatus,
        'quoteSharingAllowed': quoteSharingAllowed,
      };

  AccessInfo copyWith({
    String? country,
    String? viewability,
    bool? embeddable,
    bool? publicDomain,
    String? textToSpeechPermission,
    Epub? epub,
    Pdf? pdf,
    String? webReaderLink,
    String? accessViewStatus,
    bool? quoteSharingAllowed,
  }) {
    return AccessInfo(
      country: country ?? this.country,
      viewability: viewability ?? this.viewability,
      embeddable: embeddable ?? this.embeddable,
      publicDomain: publicDomain ?? this.publicDomain,
      textToSpeechPermission:
          textToSpeechPermission ?? this.textToSpeechPermission,
      epub: epub ?? this.epub,
      pdf: pdf ?? this.pdf,
      webReaderLink: webReaderLink ?? this.webReaderLink,
      accessViewStatus: accessViewStatus ?? this.accessViewStatus,
      quoteSharingAllowed: quoteSharingAllowed ?? this.quoteSharingAllowed,
    );
  }
}
