import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mesa_pronta/models/reservation.dart';

const String RESERVATION_COLLECTION_REF = "reservations";

class DatabaseReservationService {
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference _reservationRef;

  DatabaseReservationService() {
    _reservationRef = _firestore
        .collection(RESERVATION_COLLECTION_REF)
        .withConverter<Reservation>(
            fromFirestore: (snapshots, _) => Reservation.fromJson(
                  snapshots.data()!,
                ),
            toFirestore: (reservation, _) => reservation.toJson());
  }

  Stream<QuerySnapshot> getReservations() {
    return _reservationRef.snapshots();
  }

  void addReservation(Reservation reservation) async {
    _reservationRef.add(reservation);
  }

  void updateReservation(String id, Reservation reservation) {
    _reservationRef.doc(id).update(reservation.toJson());
  }

  void deleteReservation(String id) {
    _reservationRef.doc(id).delete();
  }
}
