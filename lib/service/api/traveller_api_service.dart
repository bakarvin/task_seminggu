import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:task_seminggu/model/one_traveler_response.dart';
import 'package:xml/xml.dart';
import 'package:http/http.dart' as http;
import 'package:task_seminggu/model/all_traveler_response.dart';
import 'package:xml2json/xml2json.dart';
class TravellerApiService {

  var BASE_URL = 'http://restapi.adequateshop.com/';
  var client = http.Client();
  
  Future<AllTravelerResponse> getAllTraveller(String page) async {
    var uri = Uri.parse(BASE_URL + 'api/Traveler?page=$page').replace();
    final Xml2Json xml2Json = Xml2Json();
    try {
      final response = await client.get(uri).timeout(const Duration(seconds: 30));
      XmlDocument xml = XmlDocument.parse(response.body);

      xml2Json.parse(xml.toString());
      var json = xml2Json.toParker();
      if (response.statusCode == HttpStatus.ok) {
        return AllTravelerResponse.fromJson(jsonDecode(json));
        // print('response Ok => $response');
      } else {
        return AllTravelerResponse.withError("Error Load Data");
        // print('response Gagal => $response');
      }
    } on TimeoutException catch (_) {
      return AllTravelerResponse.withError("Waktu Habis, Silahkan Coba Lagi");
    }
  }

  Future<OneTravelerResponse> getTravellerById(String idTraveler) async {
    var uri = Uri.parse(BASE_URL + 'api/Traveler/$idTraveler').replace();
    try {
      final response = await client.get(uri).timeout(const Duration(seconds: 30));
      final Xml2Json xml2Json = Xml2Json();

      XmlDocument xml = XmlDocument.parse(response.body);
      xml2Json.parse(xml.toString());
      var json = xml2Json.toParker();

      /*BASE CODE BIMA
      final tes = xml.findAllElements("Travelerinformation");
      List<Travelerinformation> tempList = [];
      tes.forEach((element){
        // final Xml2Json xml2Json = Xml2Json();
        xml2Json.parse(element.toString());
        var jsonString = xml2Json.toParker();
        var data = jsonDecode(jsonString);
        tempList.add(Travelerinformation(
            id: data["Travelerinformation"]["id"],
            name: data["Travelerinformation"]["name"],
            email: data["Travelerinformation"]["email"],
            adderes: data["Travelerinformation"]["adderes"],
            createdat: data["Travelerinformation"]["createdat"]
        ));
      });
      tempList.forEach((element) {
        print(element.toString());
      });
      print('print =>' + json);
      // print(jsonEncode(tempList));
      print(jsonEncode(tempList[0].name));
      */
      if (response.statusCode == HttpStatus.ok) {
        print('print =>' + json);
        return OneTravelerResponse.fromJson(jsonDecode(json));
        // print('response Ok => $response');
      } else {
        return OneTravelerResponse.withError("Error Load Data");
        // print('response Gagal => $response');
      }
    } on TimeoutException catch (_) {
      return OneTravelerResponse.withError("Waktu Habis, Silahkan Coba Lagi");
    }
  }

  Future<OneTravelerResponse> deleteTraveller(String idTraveler) async {
    var uri = Uri.parse(BASE_URL + 'api/Traveler/$idTraveler').replace();
    try {
      final response = await client.delete(uri).timeout(const Duration(seconds: 30));
      final Xml2Json xml2Json = Xml2Json();

      XmlDocument xml = XmlDocument.parse(response.body);
      xml2Json.parse(xml.toString());
      var json = xml2Json.toParker();

      /*BASE CODE BIMA
      final tes = xml.findAllElements("Travelerinformation");
      List<Travelerinformation> tempList = [];
      tes.forEach((element){
        // final Xml2Json xml2Json = Xml2Json();
        xml2Json.parse(element.toString());
        var jsonString = xml2Json.toParker();
        var data = jsonDecode(jsonString);
        tempList.add(Travelerinformation(
            id: data["Travelerinformation"]["id"],
            name: data["Travelerinformation"]["name"],
            email: data["Travelerinformation"]["email"],
            adderes: data["Travelerinformation"]["adderes"],
            createdat: data["Travelerinformation"]["createdat"]
        ));
      });
      tempList.forEach((element) {
        print(element.toString());
      });
      print('print =>' + json);
      // print(jsonEncode(tempList));
      print(jsonEncode(tempList[0].name));
      */

      if (response.statusCode == HttpStatus.ok) {
        return OneTravelerResponse.fromJson(jsonDecode(json));
        // print('response Ok => $response');
      } else {
        return OneTravelerResponse.withError("Error Load Data");
        // print('response Gagal => $response');
      }
    } on TimeoutException catch (_) {
      return OneTravelerResponse.withError("Waktu Habis, Silahkan Coba Lagi");
    }
  }

  Future<OneTravelerResponse> updateTraveller(String idTraveler, String nameTraveler, String emailTraveler, String addressTraveler) async {
    var uri = Uri.parse(BASE_URL + 'api/Traveler/$idTraveler').replace();

    Map<String, String> _headers() {
      return {
        'Content-Type': 'text/xml',
      };
    }
    final _requestBody = '''
    <Travelerinformation xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
                        <id>$idTraveler</id>
                        <name>$nameTraveler</name>
                        <email>$emailTraveler</email>
                        <adderes>$addressTraveler</adderes>
    </Travelerinformation>''';

    try {
      final response = await client.put(uri, headers: _headers(), body: _requestBody).timeout(const Duration(seconds: 30));
      final Xml2Json xml2Json = Xml2Json();

      XmlDocument xml = XmlDocument.parse(response.body);
      xml2Json.parse(xml.toString());
      var json = xml2Json.toParker();

      /*BASE CODE BIMA
      final tes = xml.findAllElements("Travelerinformation");
      List<Travelerinformation> tempList = [];
      tes.forEach((element){
        // final Xml2Json xml2Json = Xml2Json();
        xml2Json.parse(element.toString());
        var jsonString = xml2Json.toParker();
        var data = jsonDecode(jsonString);
        tempList.add(Travelerinformation(
            id: data["Travelerinformation"]["id"],
            name: data["Travelerinformation"]["name"],
            email: data["Travelerinformation"]["email"],
            adderes: data["Travelerinformation"]["adderes"],
            createdat: data["Travelerinformation"]["createdat"]
        ));
      });
      tempList.forEach((element) {
        print(element.toString());
      });
      print('print =>' + json);
      // print(jsonEncode(tempList));
      print(jsonEncode(tempList[0].name));
      */

      if (response.statusCode == HttpStatus.ok) {
        return OneTravelerResponse.fromJson(jsonDecode(json));
        // print('response Ok => $response');
      } else {
        return OneTravelerResponse.withError("Error Load Data");
        // print('response Gagal => $response');
      }
    } on TimeoutException catch (_) {
      return OneTravelerResponse.withError("Waktu Habis, Silahkan Coba Lagi");
    }
  }

  Future<OneTravelerResponse> postTraveller(String nameTraveler, String emailTraveler, String addressTraveler) async {
    var uri = Uri.parse(BASE_URL + 'api/Traveler').replace();

    Map<String, String> _headers() {
      return {
        'Content-Type': 'text/xml',
      };
    }

    final _requestBody = '''
    <Travelerinformation>
                        <name>$nameTraveler</name>
                        <email>$emailTraveler</email>
                        <adderes>$addressTraveler</adderes>
    </Travelerinformation>''';

    try {
      final response = await client.post(uri, headers: _headers(), body: _requestBody).timeout(const Duration(seconds: 30));
      final Xml2Json xml2Json = Xml2Json();

      XmlDocument xml = XmlDocument.parse(response.body);
      xml2Json.parse(xml.toString());
      var json = xml2Json.toParker();

      if (response.statusCode == HttpStatus.created) {
        return OneTravelerResponse.fromJson(jsonDecode(json));
        // print('response Ok => $response');
      } else {
        return OneTravelerResponse.withError("Error Load Data");
        // print('response Gagal => $response');
      }
    } on TimeoutException catch (_) {
      return OneTravelerResponse.withError("Waktu Habis, Silahkan Coba Lagi");
    }
  }

}