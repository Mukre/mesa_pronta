class Restaurant {
  String name;
  String address;
  String image;
  double latitude;
  double longitude;

    Restaurant({
    required this.name,
    required this.address,
    required this.image,
    required this.latitude,
    required this.longitude,
  });

  Restaurant.fromJson(Map<String, Object?> json) : this (name: json['name']! as String, address: json['address']!  as String,
  image: json['image'] as String, latitude: json['latitude'] as double, longitude: json['longitude'] as double);

    Map<String, Object?> toJson() {
    return {
      'name': name,
      'address': address,
      'image': image,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}