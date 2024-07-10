class RetrieveData {
  String type;
  List<Feature> features;
  String attribution;

  RetrieveData({
    required this.type,
    required this.features,
    required this.attribution,
  });

  factory RetrieveData.fromJson(Map<String, dynamic> json) => RetrieveData(
    type: json["type"],
    features: List<Feature>.from(json["features"].map((x) => Feature.fromJson(x))),
    attribution: json["attribution"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "features": List<dynamic>.from(features.map((x) => x.toJson())),
    "attribution": attribution,
  };
}

class Feature {
  String type;
  Geometry geometry;
  Properties properties;

  Feature({
    required this.type,
    required this.geometry,
    required this.properties,
  });

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
    type: json["type"],
    geometry: Geometry.fromJson(json["geometry"]),
    properties: Properties.fromJson(json["properties"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "geometry": geometry.toJson(),
    "properties": properties.toJson(),
  };
}

class Geometry {
  List<double> coordinates;
  String type;

  Geometry({
    required this.coordinates,
    required this.type,
  });

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
    coordinates: List<double>.from(json["coordinates"].map((x) => x?.toDouble())),
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
    "type": type,
  };
}

class Properties {
  String name;
  String namePreferred;
  String mapboxId;
  String featureType;
  String fullAddress;
  String placeFormatted;
  Context context;
  Coordinates coordinates;
  List<double> bbox;
  String language;
  String maki;
  Metadata metadata;

  Properties({
    required this.name,
    required this.namePreferred,
    required this.mapboxId,
    required this.featureType,
    required this.fullAddress,
    required this.placeFormatted,
    required this.context,
    required this.coordinates,
    required this.bbox,
    required this.language,
    required this.maki,
    required this.metadata,
  });

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
    name: json["name"],
    namePreferred: json["name_preferred"],
    mapboxId: json["mapbox_id"],
    featureType: json["feature_type"],
    fullAddress: json["full_address"],
    placeFormatted: json["place_formatted"],
    context: Context.fromJson(json["context"]),
    coordinates: Coordinates.fromJson(json["coordinates"]),
    bbox: List<double>.from(json["bbox"].map((x) => x?.toDouble())),
    language: json["language"],
    maki: json["maki"],
    metadata: Metadata.fromJson(json["metadata"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "name_preferred": namePreferred,
    "mapbox_id": mapboxId,
    "feature_type": featureType,
    "full_address": fullAddress,
    "place_formatted": placeFormatted,
    "context": context.toJson(),
    "coordinates": coordinates.toJson(),
    "bbox": List<dynamic>.from(bbox.map((x) => x)),
    "language": language,
    "maki": maki,
    "metadata": metadata.toJson(),
  };
}

class Context {
  Country country;
  Region region;
  District district;
  District place;

  Context({
    required this.country,
    required this.region,
    required this.district,
    required this.place,
  });

  factory Context.fromJson(Map<String, dynamic> json) => Context(
    country: Country.fromJson(json["country"]),
    region: Region.fromJson(json["region"]),
    district: District.fromJson(json["district"]),
    place: District.fromJson(json["place"]),
  );

  Map<String, dynamic> toJson() => {
    "country": country.toJson(),
    "region": region.toJson(),
    "district": district.toJson(),
    "place": place.toJson(),
  };
}

class Country {
  String id;
  String name;
  String countryCode;
  String countryCodeAlpha3;

  Country({
    required this.id,
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

class Coordinates {
  double latitude;
  double longitude;

  Coordinates({
    required this.latitude,
    required this.longitude,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
  };
}

class Metadata {
  Metadata();

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
  );

  Map<String, dynamic> toJson() => {
  };
}
