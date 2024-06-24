import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mesa_pronta/models/reservation.dart';
import 'package:mesa_pronta/models/restaurant.dart';
import 'package:mesa_pronta/services/database_reservation_service.dart';
import 'package:mesa_pronta/widgets/multi_select_chip.dart';

class RestaurantDetails extends StatefulWidget {
  Restaurant restaurant;
  RestaurantDetails({super.key, required this.restaurant});

  @override
  State<RestaurantDetails> createState() => _RestaurantDetailsState();
}

class _RestaurantDetailsState extends State<RestaurantDetails> {
  final DatabaseReservationService _databaseService =
      DatabaseReservationService();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF1E1D2),
      child: Wrap(
        children: [
          Image.network(widget.restaurant.image,
              height: 250,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.only(top: 24, left: 24),
            child: Text(
              widget.restaurant.name,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text(
              widget.restaurant.address,
            ),
          ),
          Center(
              child: ElevatedButton(
            onPressed: () {
              _displayTextInputDialog(widget.restaurant);
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(const Color(0xFFE6B165)),
            ),
            child: const Text(
              "Fazer reserva",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ))
        ],
      ),
    );
  }

  void _displayTextInputDialog(Restaurant restaurant) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Faça sua reserva'),
          actions: <Widget>[
            MultiSelectChip(["teste", "teste2"]),
            MaterialButton(
              color: Theme.of(context).colorScheme.primary,
              textColor: Colors.white,
              child: Text('Ok'),
              onPressed: () {
                Reservation reservation = Reservation(
                  restaurantId: restaurant.name,
                  userId: "Maurício",
                  time: getTimeStamp("21:00"),
                );
                _databaseService.addReservation(reservation);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  getTimeStamp(String timeString) {
    DateTime now = DateTime.now();
    List<String> timeParts = timeString.split(':');
    DateTime dateTime = DateTime(now.year, now.month, now.day,
        int.parse(timeParts[0]), int.parse(timeParts[1]));
    Timestamp timestamp = Timestamp.fromDate(dateTime);

    return timestamp;
  }
}
