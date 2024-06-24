import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mesa_pronta/models/restaurant.dart';

const String RESTAURANT_COLLECTION_REF = "restaurants";

class DatabaseRestaurantService {
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference _restaurantRef;

  DatabaseRestaurantService() {
    _restaurantRef = _firestore
        .collection(RESTAURANT_COLLECTION_REF)
        .withConverter<Restaurant>(
            fromFirestore: (snapshots, _) => Restaurant.fromJson(
                  snapshots.data()!,
                ),
            toFirestore: (restaurant, _) => restaurant.toJson());
  }

  Stream<QuerySnapshot> getRestaurants() {
    return _restaurantRef.snapshots();
  }

  void addRestaurant(Restaurant restaurant) async {
    _restaurantRef.add(restaurant);
  }

  void updateRestaurant(String id, Restaurant restaurant) {
    _restaurantRef.doc(id).update(restaurant.toJson());
  }

  void deleteRestaurant(String id) {
    _restaurantRef.doc(id).delete();
  }
}
