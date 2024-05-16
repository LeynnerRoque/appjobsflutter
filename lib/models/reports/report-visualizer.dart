class ReportVisualizer {
  final String title;
  final int mans;
  final int womans;

  ReportVisualizer(
      {required this.title, required this.mans, required this.womans});

  Map<String, dynamic> toJson() => {
        'title': title,
        'mans': mans,
        'womans': womans,
      };

  ReportVisualizer.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        mans = json['mans'],
        womans = json['womans'];

static ReportVisualizer goToJson(json) => ReportVisualizer(
  title: json['title'],
  mans: json['mans'],
  womans: json['womans']);
}
