import 'package:http/http.dart' as http;
import 'dart:convert';

class PeopleService {
  final url = 'http://192.168.68.30:8080/people/';

  Future<http.Response> add(data) {
    return http.post(Uri.parse(url + 'add'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data));
  }

  Future<http.Response> update(data) {
    return http.put(Uri.parse(url + 'up'),
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

  Future<http.Response> findOne(name) {
    return http.get(Uri.parse(url + 'filterByName/' + name));
  }

  Future<http.Response> peoplesOnJob(title) {
    return http.get(Uri.parse(url + 'filterByJobTitle/' + title));
  }

  Future<http.Response> peoplesOnLocal(id) {
    return http.get(Uri.parse(url + 'findByLocal/' + id.toString()));
  }

  Future<http.Response> findById(id) {
    return http.get(Uri.parse(url +'findOne/'+ id));
  }

  Future<http.Response> changeJob(data) {
    return http.put(Uri.parse(url +'changeJob/'), 
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data));
  }
}

final peopleService = PeopleService();
