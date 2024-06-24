import 'package:flutter/material.dart';
import 'package:mesa_pronta/models/restaurant.dart';

class RestaurantRepository extends ChangeNotifier {
  final List<Restaurant> _restaurants = [
    Restaurant(
      name: 'María María Self Service',
      address: 'St. Hab. Vicente Pires - Taguatinga, Brasília - DF',
      image:
          'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=wdr-9oqQiCYcmJbbIQXShg&cb_client=search.gws-prod.gps&w=408&h=240&yaw=304.6675&pitch=0&thumbfov=100',
      latitude: -15.789731363431502,
      longitude: -48.01611014641579,
    ),
    Restaurant(
      name: 'Steak Bull Churrascaria',
      address:
          'St. de Clubes Esportivos Sul Trecho 2 Conjunto 35 - Asa Sul, Brasília - DF, 70200-002',
      image:
          'https://lh5.googleusercontent.com/p/AF1QipOP6Tzb9UIQBmWTH0qUYDCjfUoXFEoWB5G-qqtr=w408-h240-k-no-pi-30.000002-ya359.88742-ro-0-fo100',
      latitude: -15.818730927471004,
      longitude: -47.87451059320025,
    ),
    Restaurant(
      name: 'McDonalds Brasilia Aguas Claras - Baa',
      address:
          'R. das Pitangueiras, 16 - Águas Claras, Brasília - DF, 71938-540',
      image:
          'https://lh5.googleusercontent.com/p/AF1QipMQ3j2VLJonAFyFPp0ht-AD32lyqrnr_JGOpOuR=w408-h306-k-no',
      latitude: -15.838165804605632,
      longitude: -48.01560848051594,
    ),
    Restaurant(
      name: 'Quintal Bar e Restaurante',
      address:
          'Setor Habitacional Vicente Pires, Vicente Pires Rua 5 • - Taguatinga, Brasília - DF, 72006-075',
      image:
          'https://lh5.googleusercontent.com/p/AF1QipOdiN2DNA9BIird7LRNMDvvl2BoL1cqFsV0KxZe=w408-h272-k-no',
      latitude: -15.799919497342364,
      longitude: -48.01527002679773,
    ),
    Restaurant(
      name: 'Coco Bambu Águas Claras',
      address:
          'R. Copaíba, 1 - Loja 188/193 - Águas Claras, Brasília - DF, 71919-540',
      image:
          'https://lh5.googleusercontent.com/p/AF1QipPqqoP9ktbI3OjNbf_t18XOFaiggzb7eeZWpqqJ=w408-h306-k-no',
      latitude: -15.830138642210038,
      longitude: -48.04206490365096,
    ),
    Restaurant(
      name: 'Panko Bistrô',
      address:
          'R. 33 Sul, 05 - Loja 04 - Águas claras Sul, Brasília - DF, 71930-250',
      image:
          'https://lh5.googleusercontent.com/p/AF1QipONeB_RdBuhZo3glKRorkfvfP3r78I1A6xDPCjA=w408-h544-k-no',
      latitude: -15.837741688411413,
      longitude: -48.03693726888244,
    ),
  ];

  List<Restaurant> get restaurants => _restaurants;
}
