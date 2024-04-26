import 'dart:ffi';

class Job {
  final int id;
  final String title;
  final String description;
  final Double salary;

  Job(
      {required this.id,
      required this.title,
      required this.description,
      required this.salary});

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'salary': salary,
      };

  Job.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        salary = json['salary'];

  static Job goToJson(json) => Job(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      salary: json['salary']);
}
