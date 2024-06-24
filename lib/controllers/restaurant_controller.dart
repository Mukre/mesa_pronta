import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mesa_pronta/pages/restaurants_page.dart';
import 'package:mesa_pronta/repositories/restaurant_repository.dart';
import 'package:mesa_pronta/services/database_restaurant_service.dart';
import 'package:mesa_pronta/widgets/restaurant_details.dart';

class RestaurantController extends ChangeNotifier {
  double lat = 0.0;
  double long = 0.0;
  String erro = '';
  Set<Marker> markers = Set<Marker>();
  late GoogleMapController _mapsController;

  get mapsController => _mapsController;

  onMapCreated(GoogleMapController gmc) async {
    _mapsController = gmc;
    getPosicao();
    loadRestaurants();
  }

  loadRestaurants() {
    final restaurants = RestaurantRepository().restaurants;
    bool _isSelected = false;
    restaurants.forEach((restaurant) async {
      markers.add(
        Marker(
          markerId: MarkerId(restaurant.name),
          position: LatLng(restaurant.latitude, restaurant.longitude),
          icon: await BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(),
            'images/food-pin.png',
          ),
          onTap: () {
            showModalBottomSheet(
              context: appKey.currentState!.context,
              builder: (context) => RestaurantDetails(restaurant: restaurant),
            );
          },
        ),
      );
    });
    notifyListeners();
  }

  getPosicao() async {
    try {
      Position posicao = await _posicaoAtual();
      lat = posicao.latitude;
      long = posicao.longitude;
      _mapsController.animateCamera(CameraUpdate.newLatLng(LatLng(lat, long)));
    } catch (e) {
      erro = e.toString();
    }
    notifyListeners();
  }

  Future<Position> _posicaoAtual() async {
    LocationPermission permissao;

    bool ativado = await Geolocator.isLocationServiceEnabled();
    if (!ativado) {
      return Future.error('Por favor, habilite a localização no smartphone');
    }

    permissao = await Geolocator.checkPermission();
    if (permissao == LocationPermission.denied) {
      permissao = await Geolocator.requestPermission();
      if (permissao == LocationPermission.denied) {
        return Future.error('Você precisa autorizar o acesso à localização');
      }
    }

    if (permissao == LocationPermission.deniedForever) {
      return Future.error('Você precisa autorizar o acesso à localização');
    }

    return await Geolocator.getCurrentPosition();
  }
}
