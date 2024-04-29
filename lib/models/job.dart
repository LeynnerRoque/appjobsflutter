class Job {
  final int id;
  final String title;
  final String description;
  final double salary;
  final int enterprise;

  Job(
      {required this.id,
      required this.title,
      required this.description,
      required this.salary,
      required this.enterprise});

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'salary': salary,
        'enterprise': enterprise
      };

  Job.fromJson(Map<String, dynamic> json): 
        id = json['id'],
        title = json['title'],
        description = json['description'],
        salary = json['salary'],
        enterprise = json['enterprise'];

  static Job goToJson(json) => Job(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      salary: json['salary'],
      enterprise: json['enterprise']);
}
