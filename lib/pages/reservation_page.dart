import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:mesa_pronta/models/reservation.dart';
import 'package:mesa_pronta/services/database_reservation_service.dart';

class ReservationPage extends StatefulWidget {
  const ReservationPage({super.key});

  @override
  State<ReservationPage> createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  final DatabaseReservationService databaseService =
      DatabaseReservationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1E1D2),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return SafeArea(
        child: Column(
      children: [_imageListView()],
    ));
  }

  Widget _imageListView() {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.80,
      width: MediaQuery.sizeOf(context).width,
      child: StreamBuilder(
        builder: (context, snapshot) {
          List reservations = snapshot.data?.docs ?? [];
          if (reservations.isEmpty) {
            return const Center(child: Text("Faça uma reserva"));
          }
          return ListView.builder(
              itemCount: reservations.length,
              itemBuilder: (context, index) {
                Reservation reservation = reservations[index].data();
                print(reservation);
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  child: ListTile(
                    tileColor: const Color(0xFF257F66),
                    title: Text(reservation.restaurantId),
                    subtitle: Text(DateFormat("dd-mm-yyyy h:m a")
                        .format(reservation.time.toDate())),
                  ),
                );
              });
        },
        stream: databaseService.getReservations(),
      ),
    );
  }
}
