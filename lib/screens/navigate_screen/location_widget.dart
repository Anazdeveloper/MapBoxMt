import 'package:ateam_flutter_mt/data/models/responses/retrieve_data.dart';
import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  final Feature location;
  const LocationWidget({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            location.properties.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20.0
            ),
        ),
        Row(
          children: [
            const Icon(Icons.location_on_outlined, color: Colors.white),
            Text('${location.properties.coordinates.longitude},${location.properties.coordinates.latitude}', style: const TextStyle(color: Colors.white))
          ],
        )
      ],
    );
  }
}
