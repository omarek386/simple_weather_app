class Location {
  final String name;
  final String region;
  final String country;
  final String localTime;

  Location({
    required this.name,
    required this.country,
    required this.region,
    required this.localTime,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'],
      country: json['country'],
      region: json['region'],
      localTime: json['localtime'],
    );
  }
}
