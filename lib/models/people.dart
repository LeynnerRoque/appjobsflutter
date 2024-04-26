class People {
  final int id;
  final String name;
  final String gender;
  final int age;
  final String regionName;
  final String email;
  final String phone;
  //Api controla os ids enviados e faz a logica de gerar o objeto
  final int job;
  final int location;

  People(
      {required this.id,
      required this.name,
      required this.gender,
      required this.age,
      required this.regionName,
      required this.email,
      required this.phone,
      required this.job,
      required this.location});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'gender': gender,
        'age': age,
        'regionName': regionName,
        'email': email,
        'phone': phone,
        'job': job,
        'location': location
      };

  People.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        gender = json['gender'],
        age = json['age'],
        regionName = json['regionName'],
        email = json['email'],
        phone = json['phone'],
        job = json['job'],
        location = json['location'];

  static People goToJson(json) => People(
      id: json['id'],
      name: json['name'],
      gender: json['gender'],
      age: json['age'],
      regionName: json['regionName'],
      email: json['email'],
      phone: json['phone'],
      job: json['job'],
      location: json['location']);
}
