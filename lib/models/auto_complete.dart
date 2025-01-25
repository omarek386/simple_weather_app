class AutoComplete {
  List<Suggestions> suggestions;

  AutoComplete({required this.suggestions});

  factory AutoComplete.fromJson(List json) {
    return AutoComplete(
      suggestions: json.map((e) => Suggestions.fromJson(e)).toList(),
    );
  }
}

class Suggestions {
  String name;
  String region;
  String country;
  double lat;
  double lon;
  String url;

  Suggestions({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.url,
  });

  factory Suggestions.fromJson(Map<String, dynamic> json) {
    return Suggestions(
      name: json['name'],
      region: json['region'],
      country: json['country'],
      lat: json['lat'],
      lon: json['lon'],
      url: json['url'],
    );
  }
}
