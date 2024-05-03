import 'package:http/http.dart' as http;
import 'dart:convert';

class EnterprisesService{

  final url = 'http://192.168.68.30:8080/enterprise/';

  Future<http.Response> addEnterprise(data){
    return http.post(Uri.parse(url+'add'),
      headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
      body: jsonEncode(data)
    );
  }

    Future<http.Response> updateEnterprise(data){
    return http.put(Uri.parse(url+'up'),
      headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
      body: jsonEncode(data)
    );
  }


    Future<http.Response> deleteEnterprise(id){
    return http.delete(Uri.parse(url+'delete/'+id.toString()),
      headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    );
  }

  Future<http.Response> listEnterprises(){
    return http.get(Uri.parse(url+'all'));
  }

  Future<http.Response> findEnterprises(filterName){
    return http.get(Uri.parse(url+'filterName/'+filterName));
  }
}
final enterpriseService = EnterprisesService();