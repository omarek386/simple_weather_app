class Location {
  final String name;
  final String region;
  final String country;

  Location({
    required this.name,
    required this.country,
    required this.region,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'],
      country: json['country'],
      region: json['region'],
    );
  }
}
