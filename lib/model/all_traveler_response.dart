class AllTravelerResponse {
  TravelerinformationResponse? travelerinformationResponse;
  String? error;

  AllTravelerResponse({this.travelerinformationResponse, this.error});

  AllTravelerResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    travelerinformationResponse = json['TravelerinformationResponse'] != null
        ? new TravelerinformationResponse.fromJson(
            json['TravelerinformationResponse'])
        : null;
  }

  factory AllTravelerResponse.withError(String error) => AllTravelerResponse(error: error);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    if (this.travelerinformationResponse != null) {
      data['TravelerinformationResponse'] =
          this.travelerinformationResponse!.toJson();
    }
    return data;
  }
}

class TravelerinformationResponse {
  String? xmlnsXsd;
  String? xmlnsXsi;
  String? page;
  String? perPage;
  String? totalrecord;
  String? totalPages;
  Travelers? travelers;

  TravelerinformationResponse(
      {this.xmlnsXsd,
      this.xmlnsXsi,
      this.page,
      this.perPage,
      this.totalrecord,
      this.totalPages,
      this.travelers});

  TravelerinformationResponse.fromJson(Map<String, dynamic> json) {
    xmlnsXsd = json['-xmlns:xsd'];
    xmlnsXsi = json['-xmlns:xsi'];
    page = json['page'];
    perPage = json['per_page'];
    totalrecord = json['totalrecord'];
    totalPages = json['total_pages'];
    travelers = json['travelers'] != null
        ? new Travelers.fromJson(json['travelers'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['-xmlns:xsd'] = this.xmlnsXsd;
    data['-xmlns:xsi'] = this.xmlnsXsi;
    data['page'] = this.page;
    data['per_page'] = this.perPage;
    data['totalrecord'] = this.totalrecord;
    data['total_pages'] = this.totalPages;
    if (this.travelers != null) {
      data['travelers'] = this.travelers!.toJson();
    }
    return data;
  }
}

class Travelers {
  List<Travelerinformation>? travelerinformation;
  String? error;

  Travelers({this.travelerinformation, this.error});

  Travelers.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    if (json['Travelerinformation'] != null) {
      travelerinformation = <Travelerinformation>[];
      json['Travelerinformation'].forEach((v) {
        travelerinformation!.add(new Travelerinformation.fromJson(v));
      });
    }
  }

  factory Travelers.withError(String error) => Travelers(error: error);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    if (this.travelerinformation != null) {
      data['Travelerinformation'] =
          this.travelerinformation!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Travelerinformation {
  String? id;
  String? name;
  String? email;
  String? adderes;
  String? createdat;

  Travelerinformation(
      {this.id, this.name, this.email, this.adderes, this.createdat});

  Travelerinformation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    adderes = json['adderes'];
    createdat = json['createdat'];
  }



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['adderes'] = this.adderes;
    data['createdat'] = this.createdat;
    return data;
  }
}
