import 'package:http/http.dart' as http;

class ReportService {
  final url = 'http://xxx.xxx.xx.xx:8080/report/';

  Future<http.Response> reportVisualizer(name) {
    return http.get(Uri.parse(url + 'visualizer/'+name));
  }
}
final reportService = ReportService();
