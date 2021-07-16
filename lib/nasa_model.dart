// To parse this JSON data, do
//
//     final nasa = nasaFromJson(jsonString);

import 'dart:convert';

Nasa nasaFromJson(String str) => Nasa.fromJson(json.decode(str));

String nasaToJson(Nasa data) => json.encode(data.toJson());

class Nasa {
  Nasa({
    this.copyright,
    this.date,
    this.explanation,
    this.hdurl,
    this.mediaType,
    this.serviceVersion,
    this.title,
    this.url,
  });

  String copyright;
  DateTime date;
  String explanation;
  String hdurl;
  String mediaType;
  String serviceVersion;
  String title;
  String url;

  factory Nasa.fromJson(Map<String, dynamic> json) => Nasa(
    copyright: json["copyright"],
    date: DateTime.parse(json["date"]),
    explanation: json["explanation"],
    hdurl: json["hdurl"],
    mediaType: json["media_type"],
    serviceVersion: json["service_version"],
    title: json["title"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "copyright": copyright,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "explanation": explanation,
    "hdurl": hdurl,
    "media_type": mediaType,
    "service_version": serviceVersion,
    "title": title,
    "url": url,
  };
}
