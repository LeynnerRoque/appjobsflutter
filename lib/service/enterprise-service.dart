import 'package:http/http.dart' as http;
import 'dart:convert';

class EnterprisesService{

  Future<http.Response> addEnterprise(data){
    return http.post(Uri.parse('http://192.168.68.30:8080/enterprise/api/add'),
      headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
      body: jsonEncode(data)
    );
  }
}
final enterpriseService = EnterprisesService();