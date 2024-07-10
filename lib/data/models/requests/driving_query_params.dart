class DrivingQueryParams {
  final String alternatives;
  final String geometries;
  final String steps;
  final String accessToken;

  DrivingQueryParams({required this.alternatives, required this.geometries, required this.steps, required this.accessToken});

  Map<String, dynamic> toJson() => {
    "alternatives": alternatives,
    "geometries": geometries,
    "steps": steps,
    "access_token": accessToken
  };
}