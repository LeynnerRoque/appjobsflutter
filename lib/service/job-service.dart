import 'package:http/http.dart' as http;
import 'dart:convert';

class JobService {
  final url = 'http://192.168.68.30:8080/job/';

  Future<http.Response> add(data) {
    return http.post(Uri.parse(url + 'api/add'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data));
  }

  Future<http.Response> update(data) {
    return http.put(Uri.parse(url + 'api/up'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data));
  }

  Future<http.Response> delete(id) {
    return http.delete(
      Uri.parse(url + 'delete/' + id.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
  }

  Future<http.Response> listAll() {
    return http.get(Uri.parse(url + 'all'));
  }

  Future<http.Response> findOne(title) {
    return http.get(Uri.parse(url + 'findTitle/' + title));
  }

  Future<http.Response> findJobOnEnterprise(foundationName) {
    return http.get(
        Uri.parse(url + 'filterByNameFoundation/' + foundationName.toString()));
  }

  Future<http.Response> findById(id) {
    return http.get(Uri.parse(url + 'findOne/' + id));
  }

  Future<http.Response> findJobVisualizer(title) {
    return http.get(Uri.parse(url + 'filterVisualizers/' + title));
  }
}

final jobService = JobService();
