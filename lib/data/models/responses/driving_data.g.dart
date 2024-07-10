// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driving_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DrivingDataAdapter extends TypeAdapter<DrivingData> {
  @override
  final int typeId = 0;

  @override
  DrivingData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DrivingData(
      routes: (fields[0] as List).cast<Route>(),
      waypoints: (fields[1] as List).cast<Waypoint>(),
      code: fields[2] as String,
      uuid: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DrivingData obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.routes)
      ..writeByte(1)
      ..write(obj.waypoints)
      ..writeByte(2)
      ..write(obj.code)
      ..writeByte(3)
      ..write(obj.uuid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DrivingDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RouteAdapter extends TypeAdapter<Route> {
  @override
  final int typeId = 1;

  @override
  Route read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Route(
      weightName: fields[0] as String,
      weight: fields[1] as double,
      duration: fields[2] as double,
      distance: fields[3] as double,
      legs: (fields[4] as List).cast<Leg>(),
      geometry: fields[5] as Geometry,
    );
  }

  @override
  void write(BinaryWriter writer, Route obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.weightName)
      ..writeByte(1)
      ..write(obj.weight)
      ..writeByte(2)
      ..write(obj.duration)
      ..writeByte(3)
      ..write(obj.distance)
      ..writeByte(4)
      ..write(obj.legs)
      ..writeByte(5)
      ..write(obj.geometry);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RouteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GeometryAdapter extends TypeAdapter<Geometry> {
  @override
  final int typeId = 2;

  @override
  Geometry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Geometry(
      coordinates: (fields[0] as List)
          .map((dynamic e) => (e as List).cast<double>())
          .toList(),
      type: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Geometry obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.coordinates)
      ..writeByte(1)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GeometryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LegAdapter extends TypeAdapter<Leg> {
  @override
  final int typeId = 3;

  @override
  Leg read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Leg(
      notifications: (fields[0] as List).cast<Notification>(),
      viaWaypoints: (fields[1] as List).cast<dynamic>(),
      admins: (fields[2] as List).cast<Admin>(),
      weight: fields[3] as double,
      duration: fields[4] as double,
      steps: (fields[5] as List).cast<Step>(),
      distance: fields[6] as double,
      summary: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Leg obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.notifications)
      ..writeByte(1)
      ..write(obj.viaWaypoints)
      ..writeByte(2)
      ..write(obj.admins)
      ..writeByte(3)
      ..write(obj.weight)
      ..writeByte(4)
      ..write(obj.duration)
      ..writeByte(5)
      ..write(obj.steps)
      ..writeByte(6)
      ..write(obj.distance)
      ..writeByte(7)
      ..write(obj.summary);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LegAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AdminAdapter extends TypeAdapter<Admin> {
  @override
  final int typeId = 4;

  @override
  Admin read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Admin(
      iso31661Alpha3: fields[0] as String,
      iso31661: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Admin obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.iso31661Alpha3)
      ..writeByte(1)
      ..write(obj.iso31661);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdminAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class NotificationAdapter extends TypeAdapter<Notification> {
  @override
  final int typeId = 5;

  @override
  Notification read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Notification(
      details: fields[0] as Details,
      subtype: fields[1] as String,
      type: fields[2] as String,
      geometryIndexEnd: fields[3] as int,
      geometryIndexStart: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Notification obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.details)
      ..writeByte(1)
      ..write(obj.subtype)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.geometryIndexEnd)
      ..writeByte(4)
      ..write(obj.geometryIndexStart);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DetailsAdapter extends TypeAdapter<Details> {
  @override
  final int typeId = 6;

  @override
  Details read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Details(
      actualValue: fields[0] as String,
      message: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Details obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.actualValue)
      ..writeByte(1)
      ..write(obj.message);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class StepAdapter extends TypeAdapter<Step> {
  @override
  final int typeId = 7;

  @override
  Step read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Step(
      intersections: (fields[0] as List).cast<Intersection>(),
      maneuver: fields[1] as Maneuver,
      name: fields[2] as String,
      duration: fields[3] as double,
      distance: fields[4] as double,
      drivingSide: fields[5] as String,
      weight: fields[6] as double,
      mode: fields[7] as String,
      ref: fields[8] as String?,
      geometry: fields[9] as Geometry,
      exits: fields[10] as String?,
      destinations: fields[11] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Step obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.intersections)
      ..writeByte(1)
      ..write(obj.maneuver)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.duration)
      ..writeByte(4)
      ..write(obj.distance)
      ..writeByte(5)
      ..write(obj.drivingSide)
      ..writeByte(6)
      ..write(obj.weight)
      ..writeByte(7)
      ..write(obj.mode)
      ..writeByte(8)
      ..write(obj.ref)
      ..writeByte(9)
      ..write(obj.geometry)
      ..writeByte(10)
      ..write(obj.exits)
      ..writeByte(11)
      ..write(obj.destinations);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StepAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class IntersectionAdapter extends TypeAdapter<Intersection> {
  @override
  final int typeId = 8;

  @override
  Intersection read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Intersection(
      classes: (fields[0] as List?)?.cast<String>(),
      entry: (fields[1] as List).cast<bool>(),
      bearings: (fields[2] as List).cast<int>(),
      duration: fields[3] as double?,
      mapboxStreetsV8: fields[4] as MapboxStreetsV8?,
      isUrban: fields[5] as bool?,
      adminIndex: fields[6] as int,
      out: fields[7] as int?,
      weight: fields[9] as double?,
      geometryIndex: fields[10] as int,
      location: (fields[11] as List).cast<double>(),
      intersectionIn: fields[12] as int?,
      lanes: (fields[13] as List?)?.cast<Lane>(),
      turnDuration: fields[14] as double?,
      turnWeight: fields[15] as double?,
      trafficSignal: fields[16] as bool?,
      yieldSign: fields[17] as bool?,
      tollCollection: fields[18] as TollCollection?,
      stopSign: fields[19] as bool?,
      railwayCrossing: fields[20] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, Intersection obj) {
    writer
      ..writeByte(20)
      ..writeByte(0)
      ..write(obj.classes)
      ..writeByte(1)
      ..write(obj.entry)
      ..writeByte(2)
      ..write(obj.bearings)
      ..writeByte(3)
      ..write(obj.duration)
      ..writeByte(4)
      ..write(obj.mapboxStreetsV8)
      ..writeByte(5)
      ..write(obj.isUrban)
      ..writeByte(6)
      ..write(obj.adminIndex)
      ..writeByte(7)
      ..write(obj.out)
      ..writeByte(9)
      ..write(obj.weight)
      ..writeByte(10)
      ..write(obj.geometryIndex)
      ..writeByte(11)
      ..write(obj.location)
      ..writeByte(12)
      ..write(obj.intersectionIn)
      ..writeByte(13)
      ..write(obj.lanes)
      ..writeByte(14)
      ..write(obj.turnDuration)
      ..writeByte(15)
      ..write(obj.turnWeight)
      ..writeByte(16)
      ..write(obj.trafficSignal)
      ..writeByte(17)
      ..write(obj.yieldSign)
      ..writeByte(18)
      ..write(obj.tollCollection)
      ..writeByte(19)
      ..write(obj.stopSign)
      ..writeByte(20)
      ..write(obj.railwayCrossing);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IntersectionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LaneAdapter extends TypeAdapter<Lane> {
  @override
  final int typeId = 9;

  @override
  Lane read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Lane(
      indications: (fields[0] as List).cast<String>(),
      validIndication: fields[1] as String?,
      valid: fields[2] as bool,
      active: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Lane obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.indications)
      ..writeByte(1)
      ..write(obj.validIndication)
      ..writeByte(2)
      ..write(obj.valid)
      ..writeByte(3)
      ..write(obj.active);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LaneAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MapboxStreetsV8Adapter extends TypeAdapter<MapboxStreetsV8> {
  @override
  final int typeId = 10;

  @override
  MapboxStreetsV8 read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MapboxStreetsV8(
      mapboxStreetsV8Class: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MapboxStreetsV8 obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.mapboxStreetsV8Class);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MapboxStreetsV8Adapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TollCollectionAdapter extends TypeAdapter<TollCollection> {
  @override
  final int typeId = 11;

  @override
  TollCollection read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TollCollection(
      type: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TollCollection obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TollCollectionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ManeuverAdapter extends TypeAdapter<Maneuver> {
  @override
  final int typeId = 12;

  @override
  Maneuver read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Maneuver(
      type: fields[0] as String,
      instruction: fields[1] as String,
      bearingAfter: fields[2] as int,
      bearingBefore: fields[3] as int,
      location: (fields[4] as List).cast<double>(),
      modifier: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Maneuver obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.instruction)
      ..writeByte(2)
      ..write(obj.bearingAfter)
      ..writeByte(3)
      ..write(obj.bearingBefore)
      ..writeByte(4)
      ..write(obj.location)
      ..writeByte(5)
      ..write(obj.modifier);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ManeuverAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WaypointAdapter extends TypeAdapter<Waypoint> {
  @override
  final int typeId = 13;

  @override
  Waypoint read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Waypoint(
      distance: fields[0] as double,
      name: fields[1] as String,
      location: (fields[2] as List).cast<double>(),
    );
  }

  @override
  void write(BinaryWriter writer, Waypoint obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.distance)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.location);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WaypointAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
