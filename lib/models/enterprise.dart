
class Enterprises{
final int id;
final String foundationName;
final String email;
final String phoneNumber;

Enterprises({
  required this.id,
  required this.foundationName,
  required this.email,
  required this.phoneNumber,
});

 Map<String, dynamic> toJson() => {
   'id': id,
  'foundationName':  foundationName,
  'email': email,
  'phoneNumber': phoneNumber,
};

Enterprises.fromJson(Map<String, dynamic> json):
id = json['id'],
foundationName = json['foundationName'],
email = json['email'],
phoneNumber = json['phoneNumber'];

static Enterprises goToJson(json) => Enterprises(
  id: json['id'],
  foundationName: json['foundationName'], 
  email: json['email'], 
  phoneNumber: json['phoneNumber']);

}