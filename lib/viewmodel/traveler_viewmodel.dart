import 'package:flutter/material.dart';
import 'package:task_seminggu/model/all_traveler_response.dart' as allTraveler;
import 'package:task_seminggu/model/one_traveler_response.dart' as oneTraveler;
import 'package:task_seminggu/service/api/traveller_api_service.dart';
import 'package:task_seminggu/service/api/traveller_api_service.dart';

class TravelerViewModel extends ChangeNotifier {
  final _travelerApi = TravellerApiService();
  List<allTraveler.Travelerinformation> listTraveler = [];
  String? currentPage;
  String? totalPage;
  oneTraveler.Travelerinformation modelTraveler = oneTraveler.Travelerinformation();

  TravelerViewModel(String page, BuildContext context){
    getTraveler(page == ""  ? "1" : page,context);
  }

  createTraveler(String page, String nameTraveler, String emailTraveler, String addressTraveler, BuildContext context) async {
    final response = await _travelerApi.postTraveller(nameTraveler, emailTraveler, addressTraveler);
    if (response.error == null){
      var id = response.oneTravelerinformation?.id.toString();

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Berhasil Tambah Data dengan Id : $id ")));
    } else {
      print(response.error.toString());

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.error.toString())));
    }

    getTraveler(page == ""  ? "1" : page, context);
    notifyListeners();
  }

  getTraveler(String page, BuildContext context) async {
    final response = await _travelerApi.getAllTraveller(page);
    if (response.error == null){
      listTraveler.clear();
      listTraveler = response.travelerinformationResponse!.travelers!.travelerinformation!;
      currentPage = response.travelerinformationResponse!.page;
      totalPage = response.travelerinformationResponse!.totalPages;
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }

  getTravelerById(String idTraveler) async {
    final response = await _travelerApi.getTravellerById(idTraveler);
    if (response.error == null){
      modelTraveler = response.oneTravelerinformation!;
      print(response.oneTravelerinformation);
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }

  updateTraveler(String page, String idTraveler, String nameTraveler, String emailTraveler, String addressTraveler, BuildContext context) async {
    final response = await _travelerApi.updateTraveller(idTraveler, nameTraveler, emailTraveler, addressTraveler);
    var id = response.oneTravelerinformation?.id.toString();
    getTraveler(page == ""  ? "1" : page, context);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Berhasil Edit Data dengan Id : $id")));
    notifyListeners();
  }

  deleteTraveler(String page, String idTraveler, BuildContext context) async {
    final response = await _travelerApi.deleteTraveller(idTraveler);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Berhasil Hapus Data")));
    getTraveler(page == ""  ? "1" : page, context);
    notifyListeners();
  }

}