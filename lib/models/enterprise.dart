class Enterprises{
final String foundationName;
final String email;
final String phoneNumber;

Enterprises({
  required this.foundationName,
  required this.email,
  required this.phoneNumber,
});

 Map<String, dynamic> toJson() => {
  'foundationName':  foundationName,
  'email': email,
  'phoneNumber': phoneNumber,
};

Enterprises.fromJson(Map<String, dynamic> json):
foundationName = json['foundationName'],
email = json['email'],
phoneNumber = json['phoneNumber'];

static Enterprises goToJson(Map<String, dynamic> json) => Enterprises(
  foundationName: json['foundationName'], 
  email: json['email'], 
  phoneNumber: json['phoneNumber']);

}