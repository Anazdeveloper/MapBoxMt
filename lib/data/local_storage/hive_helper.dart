import 'package:ateam_flutter_mt/data/models/responses/driving_data.dart';
import 'package:hive/hive.dart';

abstract class HiveObjectTypeId {
  static const drivingDataTypeId = 0;
  static const routeTypeId = 1;
  static const geometryTypeId = 2;
  static const legTypeId = 3;
  static const adminTypeId = 4;
  static const notificationTypeId = 5;
  static const detailsTypeId = 6;
  static const stepTypeId = 7;
  static const intersectionTypeId = 8;
  static const laneTypeId = 9;
  static const mapboxStreetsV8TypeId = 10;
  static const tollCollectionTypeId = 11;
  static const maneuverTypeId = 12;
  static const waypointTypeId = 13;

}

class HiveHelper {
  static const String hiveDrivingDatasBox = 'driving_data_box';
  static const String hiveRouteBox = 'route_box';
  static const String hiveGeometryBox = 'geometry_box';
  static const String hiveLegBox = 'leg_box';
  static const String hiveAdminBox = 'admin_box';
  static const String hiveNotificationBox = 'notification_box';
  static const String hiveDetailsBox = 'details_box';
  static const String hiveStepBox = 'step_box';
  static const String hiveIntersectionBox = 'intersection_box';
  static const String hiveLaneBox = 'lane_box';
  static const String hiveMapboxStreetsV8Box = 'mapboxStreetsV8_box';
  static const String hiveTollCollectionBox = 'tollCollection_box';
  static const String hiveManeuverBox = 'maneuver_box';
  static const String hiveWaypointBox = 'waypoint_box';

  Future<void> registerAndInitHiveBoxes() async {
    Hive.registerAdapter((DrivingDataAdapter()));
    Hive.registerAdapter(RouteAdapter());
    Hive.registerAdapter(GeometryAdapter());
    Hive.registerAdapter(LegAdapter());
    Hive.registerAdapter(AdminAdapter());
    Hive.registerAdapter(NotificationAdapter());
    Hive.registerAdapter(DetailsAdapter());
    Hive.registerAdapter(StepAdapter());
    Hive.registerAdapter(IntersectionAdapter());
    Hive.registerAdapter(LaneAdapter());
    Hive.registerAdapter(MapboxStreetsV8Adapter());
    Hive.registerAdapter(TollCollectionAdapter());
    Hive.registerAdapter(ManeuverAdapter());
    Hive.registerAdapter(WaypointAdapter());

    await Hive.openBox<DrivingData>(hiveDrivingDatasBox);
    await Hive.openBox<Route>(hiveRouteBox);
    await Hive.openBox<Geometry>(hiveGeometryBox);
    await Hive.openBox<Leg>(hiveLegBox);
    await Hive.openBox<Admin>(hiveAdminBox);
    await Hive.openBox<Notification>(hiveNotificationBox);
    await Hive.openBox<DrivingData>(hiveDetailsBox);
    await Hive.openBox<Step>(hiveStepBox);
    await Hive.openBox<Intersection>(hiveIntersectionBox);
    await Hive.openBox<Lane>(hiveLaneBox);
    await Hive.openBox<MapboxStreetsV8>(hiveMapboxStreetsV8Box);
    await Hive.openBox<TollCollection>(hiveTollCollectionBox);
    await Hive.openBox<Maneuver>(hiveManeuverBox);
    await Hive.openBox<Waypoint>(hiveWaypointBox);
  }

  List<DrivingData> fetchDrivingDatas() {
    var box = Hive.box<DrivingData>(hiveDrivingDatasBox);
    List<DrivingData> list = box.values.toList();
    return list;
  }

  Future<void> deleteDrivingDatas(int index) async {
    var box = Hive.box<DrivingData>(hiveDrivingDatasBox);
    await box.deleteAt(index);
  }

  Future<void> addDrivingDatas(DrivingData drivingData) async {
    var box = Hive.box<DrivingData>(hiveDrivingDatasBox);
    await box.add(drivingData);
  }
}