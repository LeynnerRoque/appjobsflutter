class Location {
  final int id;
  final String streetAddress;
  final String postalCode;
  final String city;
  final String stateProvince;

  Location(
      {required this.id,
      required this.streetAddress,
      required this.postalCode,
      required this.city,
      required this.stateProvince});

  Map<String, dynamic> toJson() => {
        'id': id,
        'streetAddress': streetAddress,
        'postalCode': postalCode,
        'city': city,
        'stateProvince': stateProvince
      };

  Location.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        streetAddress = json['streetAddress'],
        postalCode = json['postalCodes'],
        city = json['city'],
        stateProvince = json['stateProvince'];

  static Location goToJson(json) => Location(
      id: json['id'],
      streetAddress: json['streetAddress'],
      postalCode: json['postalCode'],
      city: json['city'],
      stateProvince: json['stateProvince']);
}
