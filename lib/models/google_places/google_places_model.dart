class GooglePlacesModel {
  String? status;
  List<PredictionK>? predictions;

  GooglePlacesModel({
    this.status,
    this.predictions,
  });

  GooglePlacesModel copyWith({
    String? status,
    List<PredictionK>? predictions,
  }) =>
      GooglePlacesModel(
        status: status ?? this.status,
        predictions: predictions ?? this.predictions,
      );

  factory GooglePlacesModel.fromJson(Map<String, dynamic> json) => GooglePlacesModel(
        status: json["status"],
        predictions: json["predictions"] == null ? [] : List<PredictionK>.from(json["predictions"]!.map((x) => PredictionK.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "predictions": predictions == null ? [] : List<dynamic>.from(predictions!.map((x) => x.toJson())),
      };
}

class PredictionK {
  String? description;
  List<MatchedSubstring>? matchedSubstrings;
  String? placeId;
  String? reference;
  StructuredFormatting? structuredFormatting;
  List<Term>? terms;
  List<String>? types;

  PredictionK({
    this.description,
    this.matchedSubstrings,
    this.placeId,
    this.reference,
    this.structuredFormatting,
    this.terms,
    this.types,
  });

  PredictionK copyWith({
    String? description,
    List<MatchedSubstring>? matchedSubstrings,
    String? placeId,
    String? reference,
    StructuredFormatting? structuredFormatting,
    List<Term>? terms,
    List<String>? types,
  }) =>
      PredictionK(
        description: description ?? this.description,
        matchedSubstrings: matchedSubstrings ?? this.matchedSubstrings,
        placeId: placeId ?? this.placeId,
        reference: reference ?? this.reference,
        structuredFormatting: structuredFormatting ?? this.structuredFormatting,
        terms: terms ?? this.terms,
        types: types ?? this.types,
      );

  factory PredictionK.fromJson(Map<String, dynamic> json) => PredictionK(
        description: json["description"],
        matchedSubstrings: json["matched_substrings"] == null ? [] : List<MatchedSubstring>.from(json["matched_substrings"]!.map((x) => MatchedSubstring.fromJson(x))),
        placeId: json["place_id"],
        reference: json["reference"],
        structuredFormatting: json["structured_formatting"] == null ? null : StructuredFormatting.fromJson(json["structured_formatting"]),
        terms: json["terms"] == null ? [] : List<Term>.from(json["terms"]!.map((x) => Term.fromJson(x))),
        types: json["types"] == null ? [] : List<String>.from(json["types"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "matched_substrings": matchedSubstrings == null ? [] : List<dynamic>.from(matchedSubstrings!.map((x) => x.toJson())),
        "place_id": placeId,
        "reference": reference,
        "structured_formatting": structuredFormatting?.toJson(),
        "terms": terms == null ? [] : List<dynamic>.from(terms!.map((x) => x.toJson())),
        "types": types == null ? [] : List<dynamic>.from(types!.map((x) => x)),
      };
}

class MatchedSubstring {
  int? length;
  int? offset;

  MatchedSubstring({
    this.length,
    this.offset,
  });

  MatchedSubstring copyWith({
    int? length,
    int? offset,
  }) =>
      MatchedSubstring(
        length: length ?? this.length,
        offset: offset ?? this.offset,
      );

  factory MatchedSubstring.fromJson(Map<String, dynamic> json) => MatchedSubstring(
        length: json["length"],
        offset: json["offset"],
      );

  Map<String, dynamic> toJson() => {
        "length": length,
        "offset": offset,
      };
}

class StructuredFormatting {
  String? mainText;
  List<MatchedSubstring>? mainTextMatchedSubstrings;
  String? secondaryText;

  StructuredFormatting({
    this.mainText,
    this.mainTextMatchedSubstrings,
    this.secondaryText,
  });

  StructuredFormatting copyWith({
    String? mainText,
    List<MatchedSubstring>? mainTextMatchedSubstrings,
    String? secondaryText,
  }) =>
      StructuredFormatting(
        mainText: mainText ?? this.mainText,
        mainTextMatchedSubstrings: mainTextMatchedSubstrings ?? this.mainTextMatchedSubstrings,
        secondaryText: secondaryText ?? this.secondaryText,
      );

  factory StructuredFormatting.fromJson(Map<String, dynamic> json) => StructuredFormatting(
        mainText: json["main_text"],
        mainTextMatchedSubstrings: json["main_text_matched_substrings"] == null ? [] : List<MatchedSubstring>.from(json["main_text_matched_substrings"]!.map((x) => MatchedSubstring.fromJson(x))),
        secondaryText: json["secondary_text"],
      );

  Map<String, dynamic> toJson() => {
        "main_text": mainText,
        "main_text_matched_substrings": mainTextMatchedSubstrings == null ? [] : List<dynamic>.from(mainTextMatchedSubstrings!.map((x) => x.toJson())),
        "secondary_text": secondaryText,
      };
}

class Term {
  int? offset;
  String? value;

  Term({
    this.offset,
    this.value,
  });

  Term copyWith({
    int? offset,
    String? value,
  }) =>
      Term(
        offset: offset ?? this.offset,
        value: value ?? this.value,
      );

  factory Term.fromJson(Map<String, dynamic> json) => Term(
        offset: json["offset"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "offset": offset,
        "value": value,
      };
}
