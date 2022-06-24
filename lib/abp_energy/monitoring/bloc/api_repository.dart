import 'dart:convert';
import 'package:face_id_plus/abp_energy/monitoring/model/barging_model.dart';
import 'package:face_id_plus/abp_energy/monitoring/model/crushing_model.dart';
import 'package:face_id_plus/abp_energy/monitoring/model/hauling_model.dart';
import 'package:face_id_plus/abp_energy/monitoring/model/ob_model.dart';
import 'package:face_id_plus/abp_energy/monitoring/model/stock_model.dart';
import 'package:http/http.dart' as http;

class ApiRepository{
  Future<ApiOB> getOB(int page) async {
    var url = Uri.parse("https://lp.abpjobsite.com/api/monitoring/ob?page=$page"); 
    var apiWeb = await http.get(url);
    var objekJson = json.decode(apiWeb.body);
    return ApiOB.fromJson(objekJson);  
  }

  Future<ApiHauling> getHauling(int page) async {
    var url = Uri.parse("https://lp.abpjobsite.com/api/monitoring/hauling?page=$page"); 
    var apiWeb = await http.get(url);
    var objekJson = json.decode(apiWeb.body);
    return ApiHauling.fromJson(objekJson);  
  }

  Future<ApiCrushing> getCrushing(int page) async {
    var url = Uri.parse("https://lp.abpjobsite.com/api/monitoring/crushing?page=$page"); 
    var apiWeb = await http.get(url);
    var objekJson = json.decode(apiWeb.body);
    return ApiCrushing.fromJson(objekJson);  
  }

  Future<ApiBarging> getBarging(int page) async {
    var url = Uri.parse("https://lp.abpjobsite.com/api/monitoring/barging?page=$page"); 
    var apiWeb = await http.get(url);
    var objekJson = json.decode(apiWeb.body);
    return ApiBarging.fromJson(objekJson);  
  }

  Future<ApiStock> getStock(int page) async {
    var url = Uri.parse("https://lp.abpjobsite.com/api/monitoring/stock?page=$page"); 
    var apiWeb = await http.get(url);
    var objekJson = json.decode(apiWeb.body);
    return ApiStock.fromJson(objekJson);  
  }
}