class OneTravelerResponse {
  Travelerinformation? oneTravelerinformation;
  String? error;

  OneTravelerResponse({this.oneTravelerinformation, this.error});

  OneTravelerResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    oneTravelerinformation = json['Travelerinformation'] != null
        ? new Travelerinformation.fromJson(json['Travelerinformation'])
        : null;
  }

  factory OneTravelerResponse.withError(String error) => OneTravelerResponse(error: error);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    if (this.oneTravelerinformation != null) {
      data['Travelerinformation'] = this.oneTravelerinformation!.toJson();
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
  String? sXmlnsXsd;
  String? sXmlnsXsi;

  Travelerinformation(
      {this.id,
        this.name,
        this.email,
        this.adderes,
        this.createdat,
        this.sXmlnsXsd,
        this.sXmlnsXsi});

  Travelerinformation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    adderes = json['adderes'];
    createdat = json['createdat'];
    sXmlnsXsd = json['_xmlns:xsd'];
    sXmlnsXsi = json['_xmlns:xsi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['adderes'] = this.adderes;
    data['createdat'] = this.createdat;
    data['_xmlns:xsd'] = this.sXmlnsXsd;
    data['_xmlns:xsi'] = this.sXmlnsXsi;
    return data;
  }
}