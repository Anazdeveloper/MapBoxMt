class SuggestionData {
  List<Suggestion> suggestions;
  String attribution;
  String responseId;

  SuggestionData({
    required this.suggestions,
    required this.attribution,
    required this.responseId,
  });

  factory SuggestionData.fromJson(Map<String, dynamic> json) => SuggestionData(
    suggestions: List<Suggestion>.from(json["suggestions"].map((x) => Suggestion.fromJson(x))),
    attribution: json["attribution"],
    responseId: json["response_id"],
  );

  Map<String, dynamic> toJson() => {
    "suggestions": List<dynamic>.from(suggestions.map((x) => x.toJson())),
    "attribution": attribution,
    "response_id": responseId,
  };
}

class Suggestion {
  String name;
  String mapboxId;
  String featureType;
  String placeFormatted;
  String language;
  String maki;
  String? address;
  String? fullAddress;
  List<String>? poiCategory;
  List<String>? poiCategoryIds;
  ExternalIds? externalIds;

  Suggestion({
    required this.name,
    required this.mapboxId,
    required this.featureType,
    required this.placeFormatted,
    required this.language,
    required this.maki,
    this.address,
    this.fullAddress,
    this.poiCategory,
    this.poiCategoryIds,
    this.externalIds,
  });

  factory Suggestion.fromJson(Map<String, dynamic> json) => Suggestion(
    name: json["name"],
    mapboxId: json["mapbox_id"],
    featureType: json["feature_type"],
    placeFormatted: json["place_formatted"],
    // context: Context.fromJson(json["context"]),
    language: json["language"],
    maki: json["maki"],
    address: json["address"],
    fullAddress: json["full_address"],
    poiCategory: json["poi_category"] == null ? [] : List<String>.from(json["poi_category"]!.map((x) => x)),
    poiCategoryIds: json["poi_category_ids"] == null ? [] : List<String>.from(json["poi_category_ids"]!.map((x) => x)),
    externalIds: json["external_ids"] == null ? null : ExternalIds.fromJson(json["external_ids"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "mapbox_id": mapboxId,
    "feature_type": featureType,
    "place_formatted": placeFormatted,
    // "context": context.toJson(),
    "language": language,
    "maki": maki,
    "address": address,
    "full_address": fullAddress,
    "poi_category": poiCategory == null ? [] : List<dynamic>.from(poiCategory!.map((x) => x)),
    "poi_category_ids": poiCategoryIds == null ? [] : List<dynamic>.from(poiCategoryIds!.map((x) => x)),
    "external_ids": externalIds?.toJson(),
  };
}

class Context {
  Country country;
  Region? region;
  District? district;
  District? postcode;
  District? place;
  Street? street;

  Context({
    required this.country,
    this.region,
    this.district,
    this.postcode,
    this.place,
    this.street,
  });

  factory Context.fromJson(Map<String, dynamic> json) => Context(
    country: Country.fromJson(json["country"]),
    region: json["region"] == null ? null : Region.fromJson(json["region"]),
    district: json["district"] == null ? null : District.fromJson(json["district"]),
    postcode: json["postcode"] == null ? null : District.fromJson(json["postcode"]),
    place: json["place"] == null ? null : District.fromJson(json["place"]),
    street: json["street"] == null ? null : Street.fromJson(json["street"]),
  );

  Map<String, dynamic> toJson() => {
    "country": country.toJson(),
    "region": region?.toJson(),
    "district": district?.toJson(),
    "postcode": postcode?.toJson(),
    "place": place?.toJson(),
    "street": street?.toJson(),
  };
}

class Country {
  String? id;
  String name;
  String countryCode;
  String countryCodeAlpha3;

  Country({
    this.id,
    required this.name,
    required this.countryCode,
    required this.countryCodeAlpha3,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    id: json["id"],
    name: json["name"],
    countryCode: json["country_code"],
    countryCodeAlpha3: json["country_code_alpha_3"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "country_code": countryCode,
    "country_code_alpha_3": countryCodeAlpha3,
  };
}

class District {
  String id;
  String name;

  District({
    required this.id,
    required this.name,
  });

  factory District.fromJson(Map<String, dynamic> json) => District(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class Region {
  String id;
  String name;
  String regionCode;
  String regionCodeFull;

  Region({
    required this.id,
    required this.name,
    required this.regionCode,
    required this.regionCodeFull,
  });

  factory Region.fromJson(Map<String, dynamic> json) => Region(
    id: json["id"],
    name: json["name"],
    regionCode: json["region_code"],
    regionCodeFull: json["region_code_full"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "region_code": regionCode,
    "region_code_full": regionCodeFull,
  };
}

class Street {
  String name;

  Street({
    required this.name,
  });

  factory Street.fromJson(Map<String, dynamic> json) => Street(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}

class ExternalIds {
  String foursquare;

  ExternalIds({
    required this.foursquare,
  });

  factory ExternalIds.fromJson(Map<String, dynamic> json) => ExternalIds(
    foursquare: json["foursquare"],
  );

  Map<String, dynamic> toJson() => {
    "foursquare": foursquare,
  };
}

// class Metadata {
//   Metadata();
//
//   factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
//   );
//
//   Map<String, dynamic> toJson() => {
//   };
// }
