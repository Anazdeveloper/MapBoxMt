
import 'package:ateam_flutter_mt/data/local_storage/hive_helper.dart';
import 'package:hive/hive.dart';

part 'driving_data.g.dart';

@HiveType(typeId: HiveObjectTypeId.drivingDataTypeId)
class DrivingData {
  @HiveField(0)
  List<Route> routes;

  @HiveField(1)
  List<Waypoint> waypoints;

  @HiveField(2)
  String code;

  @HiveField(3)
  String uuid;

  DrivingData({
    required this.routes,
    required this.waypoints,
    required this.code,
    required this.uuid,
  });

  factory DrivingData.fromJson(Map<String, dynamic> json) => DrivingData(
    routes: List<Route>.from(json["routes"].map((x) => Route.fromJson(x))),
    waypoints: List<Waypoint>.from(json["waypoints"].map((x) => Waypoint.fromJson(x))),
    code: json["code"],
    uuid: json["uuid"],
  );

  Map<String, dynamic> toJson() => {
    "routes": List<dynamic>.from(routes.map((x) => x.toJson())),
    "waypoints": List<dynamic>.from(waypoints.map((x) => x.toJson())),
    "code": code,
    "uuid": uuid,
  };
}

@HiveType(typeId: HiveObjectTypeId.routeTypeId)
class Route {
  @HiveField(0)
  String weightName;

  @HiveField(1)
  double weight;

  @HiveField(2)
  double duration;

  @HiveField(3)
  double distance;

  @HiveField(4)
  List<Leg> legs;

  @HiveField(5)
  Geometry geometry;

  Route({
    required this.weightName,
    required this.weight,
    required this.duration,
    required this.distance,
    required this.legs,
    required this.geometry,
  });

  factory Route.fromJson(Map<String, dynamic> json) => Route(
    weightName: json["weight_name"],
    weight: json["weight"]?.toDouble(),
    duration: json["duration"]?.toDouble(),
    distance: json["distance"]?.toDouble(),
    legs: List<Leg>.from(json["legs"].map((x) => Leg.fromJson(x))),
    geometry: Geometry.fromJson(json["geometry"]),
  );

  Map<String, dynamic> toJson() => {
    "weight_name": weightName,
    "weight": weight,
    "duration": duration,
    "distance": distance,
    "legs": List<dynamic>.from(legs.map((x) => x.toJson())),
    "geometry": geometry.toJson(),
  };
}

@HiveType(typeId: HiveObjectTypeId.geometryTypeId)
class Geometry {
  @HiveField(0)
  List<List<double>> coordinates;

  @HiveField(1)
  String type;

  Geometry({
    required this.coordinates,
    required this.type,
  });

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
    coordinates: List<List<double>>.from(json["coordinates"].map((x) => List<double>.from(x.map((x) => x?.toDouble())))),
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "coordinates": List<dynamic>.from(coordinates.map((x) => List<dynamic>.from(x.map((x) => x)))),
    "type": type,
  };
}

@HiveType(typeId: HiveObjectTypeId.legTypeId)
class Leg {

  @HiveField(0)
  List<Notification> notifications;

  @HiveField(1)
  List<dynamic> viaWaypoints;

  @HiveField(2)
  List<Admin> admins;

  @HiveField(3)
  double weight;

  @HiveField(4)
  double duration;

  @HiveField(5)
  List<Step> steps;

  @HiveField(6)
  double distance;

  @HiveField(7)
  String summary;

  Leg({
    required this.notifications,
    required this.viaWaypoints,
    required this.admins,
    required this.weight,
    required this.duration,
    required this.steps,
    required this.distance,
    required this.summary,
  });

  factory Leg.fromJson(Map<String, dynamic> json) => Leg(
    notifications: List<Notification>.from(json["notifications"].map((x) => Notification.fromJson(x))),
    viaWaypoints: List<dynamic>.from(json["via_waypoints"].map((x) => x)),
    admins: List<Admin>.from(json["admins"].map((x) => Admin.fromJson(x))),
    weight: json["weight"]?.toDouble(),
    duration: json["duration"]?.toDouble(),
    steps: List<Step>.from(json["steps"].map((x) => Step.fromJson(x))),
    distance: json["distance"]?.toDouble(),
    summary: json["summary"],
  );

  Map<String, dynamic> toJson() => {
    "notifications": List<dynamic>.from(notifications.map((x) => x.toJson())),
    "via_waypoints": List<dynamic>.from(viaWaypoints.map((x) => x)),
    "admins": List<dynamic>.from(admins.map((x) => x.toJson())),
    "weight": weight,
    "duration": duration,
    "steps": List<dynamic>.from(steps.map((x) => x.toJson())),
    "distance": distance,
    "summary": summary,
  };
}

@HiveType(typeId: HiveObjectTypeId.adminTypeId)
class Admin {

  @HiveField(0)
  String iso31661Alpha3;

  @HiveField(1)
  String iso31661;

  Admin({
    required this.iso31661Alpha3,
    required this.iso31661,
  });

  factory Admin.fromJson(Map<String, dynamic> json) => Admin(
    iso31661Alpha3: json["iso_3166_1_alpha3"],
    iso31661: json["iso_3166_1"],
  );

  Map<String, dynamic> toJson() => {
    "iso_3166_1_alpha3": iso31661Alpha3,
    "iso_3166_1": iso31661,
  };
}

@HiveType(typeId: HiveObjectTypeId.notificationTypeId)
class Notification {

  @HiveField(0)
  Details details;

  @HiveField(1)
  String subtype;

  @HiveField(2)
  String type;

  @HiveField(3)
  int geometryIndexEnd;

  @HiveField(4)
  int geometryIndexStart;

  Notification({
    required this.details,
    required this.subtype,
    required this.type,
    required this.geometryIndexEnd,
    required this.geometryIndexStart,
  });

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
    details: Details.fromJson(json["details"]),
    subtype: json["subtype"],
    type: json["type"],
    geometryIndexEnd: json["geometry_index_end"],
    geometryIndexStart: json["geometry_index_start"],
  );

  Map<String, dynamic> toJson() => {
    "details": details.toJson(),
    "subtype": subtype,
    "type": type,
    "geometry_index_end": geometryIndexEnd,
    "geometry_index_start": geometryIndexStart,
  };
}

@HiveType(typeId: HiveObjectTypeId.detailsTypeId)
class Details {

  @HiveField(0)
  String actualValue;

  @HiveField(1)
  String message;

  Details({
    required this.actualValue,
    required this.message,
  });

  factory Details.fromJson(Map<String, dynamic> json) => Details(
    actualValue: json["actual_value"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "actual_value": actualValue,
    "message": message,
  };
}

@HiveType(typeId: HiveObjectTypeId.stepTypeId)
class Step {

  @HiveField(0)
  List<Intersection> intersections;

  @HiveField(1)
  Maneuver maneuver;

  @HiveField(2)
  String name;

  @HiveField(3)
  double duration;

  @HiveField(4)
  double distance;

  @HiveField(5)
  String drivingSide;

  @HiveField(6)
  double weight;

  @HiveField(7)
  String mode;

  @HiveField(8)
  String? ref;

  @HiveField(9)
  Geometry geometry;

  @HiveField(10)
  String? exits;

  @HiveField(11)
  String? destinations;

  Step({
    required this.intersections,
    required this.maneuver,
    required this.name,
    required this.duration,
    required this.distance,
    required this.drivingSide,
    required this.weight,
    required this.mode,
    this.ref,
    required this.geometry,
    this.exits,
    this.destinations,
  });

  factory Step.fromJson(Map<String, dynamic> json) => Step(
    intersections: List<Intersection>.from(json["intersections"].map((x) => Intersection.fromJson(x))),
    maneuver: Maneuver.fromJson(json["maneuver"]),
    name: json["name"],
    duration: json["duration"]?.toDouble(),
    distance: json["distance"]?.toDouble(),
    drivingSide: json["driving_side"],
    weight: json["weight"]?.toDouble(),
    mode: json["mode"],
    ref: json["ref"],
    geometry: Geometry.fromJson(json["geometry"]),
    exits: json["exits"],
    destinations: json["destinations"],
  );

  Map<String, dynamic> toJson() => {
    "intersections": List<dynamic>.from(intersections.map((x) => x.toJson())),
    "maneuver": maneuver.toJson(),
    "name": name,
    "duration": duration,
    "distance": distance,
    "driving_side": drivingSide,
    "weight": weight,
    "mode": mode,
    "ref": ref,
    "geometry": geometry.toJson(),
    "exits": exits,
    "destinations": destinations,
  };
}

@HiveType(typeId: HiveObjectTypeId.intersectionTypeId)
class Intersection {

  @HiveField(0)
  List<String>? classes;

  @HiveField(1)
  List<bool> entry;

  @HiveField(2)
  List<int> bearings;

  @HiveField(3)
  double? duration;

  @HiveField(4)
  MapboxStreetsV8? mapboxStreetsV8;

  @HiveField(5)
  bool? isUrban;

  @HiveField(6)
  int adminIndex;

  @HiveField(7)

  @HiveField(8)
  int? out;

  @HiveField(9)
  double? weight;

  @HiveField(10)
  int geometryIndex;

  @HiveField(11)
  List<double> location;

  @HiveField(12)
  int? intersectionIn;

  @HiveField(13)
  List<Lane>? lanes;

  @HiveField(14)
  double? turnDuration;

  @HiveField(15)
  double? turnWeight;

  @HiveField(16)
  bool? trafficSignal;

  @HiveField(17)
  bool? yieldSign;

  @HiveField(18)
  TollCollection? tollCollection;

  @HiveField(19)
  bool? stopSign;

  @HiveField(20)
  bool? railwayCrossing;

  Intersection({
    this.classes,
    required this.entry,
    required this.bearings,
    this.duration,
    this.mapboxStreetsV8,
    this.isUrban,
    required this.adminIndex,
    this.out,
    this.weight,
    required this.geometryIndex,
    required this.location,
    this.intersectionIn,
    this.lanes,
    this.turnDuration,
    this.turnWeight,
    this.trafficSignal,
    this.yieldSign,
    this.tollCollection,
    this.stopSign,
    this.railwayCrossing,
  });

  factory Intersection.fromJson(Map<String, dynamic> json) => Intersection(
    classes: json["classes"] == null ? [] : List<String>.from(json["classes"]!.map((x) => x)),
    entry: List<bool>.from(json["entry"].map((x) => x)),
    bearings: List<int>.from(json["bearings"].map((x) => x)),
    duration: json["duration"]?.toDouble(),
    mapboxStreetsV8: json["mapbox_streets_v8"] == null ? null : MapboxStreetsV8.fromJson(json["mapbox_streets_v8"]),
    isUrban: json["is_urban"],
    adminIndex: json["admin_index"],
    out: json["out"],
    weight: json["weight"]?.toDouble(),
    geometryIndex: json["geometry_index"],
    location: List<double>.from(json["location"].map((x) => x?.toDouble())),
    intersectionIn: json["in"],
    lanes: json["lanes"] == null ? [] : List<Lane>.from(json["lanes"]!.map((x) => Lane.fromJson(x))),
    turnDuration: json["turn_duration"]?.toDouble(),
    turnWeight: json["turn_weight"]?.toDouble(),
    trafficSignal: json["traffic_signal"],
    yieldSign: json["yield_sign"],
    tollCollection: json["toll_collection"] == null ? null : TollCollection.fromJson(json["toll_collection"]),
    stopSign: json["stop_sign"],
    railwayCrossing: json["railway_crossing"],
  );

  Map<String, dynamic> toJson() => {
    "classes": classes == null ? [] : List<dynamic>.from(classes!.map((x) => x)),
    "entry": List<dynamic>.from(entry.map((x) => x)),
    "bearings": List<dynamic>.from(bearings.map((x) => x)),
    "duration": duration,
    "mapbox_streets_v8": mapboxStreetsV8?.toJson(),
    "is_urban": isUrban,
    "admin_index": adminIndex,
    "out": out,
    "weight": weight,
    "geometry_index": geometryIndex,
    "location": List<dynamic>.from(location.map((x) => x)),
    "in": intersectionIn,
    "lanes": lanes == null ? [] : List<dynamic>.from(lanes!.map((x) => x.toJson())),
    "turn_duration": turnDuration,
    "turn_weight": turnWeight,
    "traffic_signal": trafficSignal,
    "yield_sign": yieldSign,
    "toll_collection": tollCollection?.toJson(),
    "stop_sign": stopSign,
    "railway_crossing": railwayCrossing,
  };
}

@HiveType(typeId: HiveObjectTypeId.laneTypeId)
class Lane {

  @HiveField(0)
  List<String> indications;

  @HiveField(1)
  String? validIndication;

  @HiveField(2)
  bool valid;

  @HiveField(3)
  bool active;

  Lane({
    required this.indications,
    this.validIndication,
    required this.valid,
    required this.active,
  });

  factory Lane.fromJson(Map<String, dynamic> json) => Lane(
    indications: List<String>.from(json["indications"].map((x) => x)),
    validIndication: json["valid_indication"],
    valid: json["valid"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "indications": List<dynamic>.from(indications.map((x) => x)),
    "valid_indication": validIndication,
    "valid": valid,
    "active": active,
  };
}

@HiveType(typeId: HiveObjectTypeId.mapboxStreetsV8TypeId)
class MapboxStreetsV8 {
  @HiveField(0)
  String mapboxStreetsV8Class;

  MapboxStreetsV8({
    required this.mapboxStreetsV8Class,
  });

  factory MapboxStreetsV8.fromJson(Map<String, dynamic> json) => MapboxStreetsV8(
    mapboxStreetsV8Class: json["class"],
  );

  Map<String, dynamic> toJson() => {
    "class": mapboxStreetsV8Class,
  };
}

@HiveType(typeId: HiveObjectTypeId.tollCollectionTypeId)
class TollCollection {
  @HiveField(0)
  String type;

  TollCollection({
    required this.type,
  });

  factory TollCollection.fromJson(Map<String, dynamic> json) => TollCollection(
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
  };
}

@HiveType(typeId: HiveObjectTypeId.maneuverTypeId)
class Maneuver {

  @HiveField(0)
  String type;

  @HiveField(1)
  String instruction;

  @HiveField(2)
  int bearingAfter;

  @HiveField(3)
  int bearingBefore;

  @HiveField(4)
  List<double> location;

  @HiveField(5)
  String? modifier;

  Maneuver({
    required this.type,
    required this.instruction,
    required this.bearingAfter,
    required this.bearingBefore,
    required this.location,
    this.modifier,
  });

  factory Maneuver.fromJson(Map<String, dynamic> json) => Maneuver(
    type: json["type"],
    instruction: json["instruction"],
    bearingAfter: json["bearing_after"],
    bearingBefore: json["bearing_before"],
    location: List<double>.from(json["location"].map((x) => x?.toDouble())),
    modifier: json["modifier"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "instruction": instruction,
    "bearing_after": bearingAfter,
    "bearing_before": bearingBefore,
    "location": List<dynamic>.from(location.map((x) => x)),
    "modifier": modifier,
  };
}

@HiveType(typeId: HiveObjectTypeId.waypointTypeId)
class Waypoint {

  @HiveField(0)
  double distance;

  @HiveField(1)
  String name;

  @HiveField(2)
  List<double> location;

  Waypoint({
    required this.distance,
    required this.name,
    required this.location,
  });

  factory Waypoint.fromJson(Map<String, dynamic> json) => Waypoint(
    distance: json["distance"]?.toDouble(),
    name: json["name"],
    location: List<double>.from(json["location"].map((x) => x?.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "distance": distance,
    "name": name,
    "location": List<dynamic>.from(location.map((x) => x)),
  };
}
