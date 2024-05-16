// To parse this JSON data, do
//
//     final chiste = chisteFromJson(jsonString);

import 'dart:convert';

Chiste chisteFromJson(String str) => Chiste.fromJson(json.decode(str));

String chisteToJson(Chiste data) => json.encode(data.toJson());

class Chiste {
    String iconUrl;
    String id;
    String url;
    String value;

    Chiste({
        required this.iconUrl,
        required this.id,
        required this.url,
        required this.value,
    });

    factory Chiste.fromJson(Map<String, dynamic> json) => Chiste(
        iconUrl: json["icon_url"],
        id: json["id"],
        url: json["url"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "icon_url": iconUrl,
        "id": id,
        "url": url,
        "value": value,
    };
}
