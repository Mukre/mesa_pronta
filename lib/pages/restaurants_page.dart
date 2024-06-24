import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mesa_pronta/controllers/restaurant_controller.dart';
import 'package:provider/provider.dart';

final appKey = GlobalKey();

class RestaurantsPage extends StatelessWidget {
  const RestaurantsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: appKey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Restaurantes"),
        backgroundColor: const Color(0xFFE6B165),
      ),
      body: ChangeNotifierProvider<RestaurantController>(
        create: (context) => RestaurantController(),
        child: Builder(
          builder: (context) {
            final local = context.watch<RestaurantController>();

            return GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(local.lat, local.long),
                zoom: 18,
              ),
              zoomControlsEnabled: true,
              mapType: MapType.normal,
              myLocationEnabled: true,
              onMapCreated: local.onMapCreated,
              markers: local.markers,
            );
          },
        ),
      ),
    );
  }
}
