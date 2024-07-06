// To parse this JSON data, do
//
//     final addpadmodel = addpadmodelFromJson(jsonString);

import 'dart:convert';

Addpadmodel addpadmodelFromJson(String str) => Addpadmodel.fromJson(json.decode(str));

String addpadmodelToJson(Addpadmodel data) => json.encode(data.toJson());

class Addpadmodel {
    List<Pad> pads;

    Addpadmodel({
        required this.pads,
    });

    factory Addpadmodel.fromJson(Map<String, dynamic> json) => Addpadmodel(
        pads: List<Pad>.from(json["pads"].map((x) => Pad.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "pads": List<dynamic>.from(pads.map((x) => x.toJson())),
    };
}

class Pad {
    String padId;
    String? sfPadId;
    String padName;
    String? subscriptionType;
    String? startDate;
    String? subscriptionRequestStatus;
    String? status;

    Pad({
        required this.padId,
        required this.sfPadId,
        required this.padName,
        required this.subscriptionType,
        required this.startDate,
        required this.subscriptionRequestStatus,
        required this.status,
    });

    factory Pad.fromJson(Map<String, dynamic> json) => Pad(
        padId: json["padId"],
        sfPadId: json["SFPadId"],
        padName: json["padName"],
        subscriptionType: json["subscriptionType"],
        startDate: json["startDate"],
        subscriptionRequestStatus: json["subscriptionRequestStatus"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "padId": padId,
        "SFPadId": sfPadId,
        "padName": padName,
        "subscriptionType": subscriptionType,
        "startDate": startDate,
        "subscriptionRequestStatus": subscriptionRequestStatus,
        "status": status,
    };
}
