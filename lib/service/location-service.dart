import 'package:http/http.dart' as http;
import 'dart:convert';

class LocationService{
  final url = 'http://192.168.68.30:8080/location/';

    Future<http.Response> add(data){
    return http.post(Uri.parse(url+'add'),
      headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
      body: jsonEncode(data)
    );
  }

  Future<http.Response> listAll(){
    return http.get(Uri.parse(url+'all'));
  }
}
final locationService = LocationService();