class PanelizationSummary {
  bool? containsEpubBubbles;
  bool? containsImageBubbles;

  PanelizationSummary({
    this.containsEpubBubbles,
    this.containsImageBubbles,
  });

  @override
  String toString() {
    return 'PanelizationSummary(containsEpubBubbles: $containsEpubBubbles, containsImageBubbles: $containsImageBubbles)';
  }

  factory PanelizationSummary.fromJson(Map<String, dynamic> json) {
    return PanelizationSummary(
      containsEpubBubbles: json['containsEpubBubbles'] as bool?,
      containsImageBubbles: json['containsImageBubbles'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
        'containsEpubBubbles': containsEpubBubbles,
        'containsImageBubbles': containsImageBubbles,
      };

  PanelizationSummary copyWith({
    bool? containsEpubBubbles,
    bool? containsImageBubbles,
  }) {
    return PanelizationSummary(
      containsEpubBubbles: containsEpubBubbles ?? this.containsEpubBubbles,
      containsImageBubbles: containsImageBubbles ?? this.containsImageBubbles,
    );
  }
}
