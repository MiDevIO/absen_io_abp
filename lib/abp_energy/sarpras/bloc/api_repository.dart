import 'package:face_id_plus/abp_energy/sarpras/model/penumpang_model.dart';
import 'package:face_id_plus/abp_energy/sarpras/model/sarana_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiRepository{
  Future<ApiSarana> getSarana(int page) async {
    var url = Uri.parse("https://lp.abpjobsite.com/api/list/sarana?page=$page"); 
    var apiWeb = await http.get(url);
    var objekJson = json.decode(apiWeb.body);
    return ApiSarana.fromJson(objekJson);  
  }

  Future<ApiPenumpang> getPenumpang(int page) async {
    var url = Uri.parse("https://lp.abpjobsite.com/api/list/penumpang?page=$page"); 
    var apiWeb = await http.get(url);
    var objekJson = json.decode(apiWeb.body);
    return ApiPenumpang.fromJson(objekJson);  
  }
}