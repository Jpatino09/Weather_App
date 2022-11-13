import 'dart:convert';

class Sys {
  Sys({
    this.country,
  });

  String? country;

  factory Sys.fromJson(String str) => Sys.fromMap(json.decode(str));

  factory Sys.fromMap(Map<String, dynamic> json) => Sys(
        country: json["country"],
      );
}
