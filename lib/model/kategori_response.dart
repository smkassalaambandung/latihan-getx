// To parse this JSON data, do
//
//     final kategoryResponse = kategoryResponseFromJson(jsonString);

import 'dart:convert';

KategoryResponse kategoryResponseFromJson(String str) => KategoryResponse.fromJson(json.decode(str));

String kategoryResponseToJson(KategoryResponse data) => json.encode(data.toJson());

class KategoryResponse {
  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<Data> data;
  final Support support;

  KategoryResponse({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
    required this.support,
  });

  factory KategoryResponse.fromJson(Map<String, dynamic> json) => KategoryResponse(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
        support: Support.fromJson(json["support"]),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "total": total,
        "total_pages": totalPages,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "support": support.toJson(),
      };
}

class Data {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  Data({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
}

class Support {
  final String url;
  final String text;

  Support({
    required this.url,
    required this.text,
  });

  factory Support.fromJson(Map<String, dynamic> json) => Support(
        url: json["url"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "text": text,
      };
}
