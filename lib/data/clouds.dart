import 'dart:convert';

class Clouds {
  Clouds({
    required this.all,
  });

  int all;

  factory Clouds.fromJson(String str) => Clouds.fromMap(json.decode(str));

  factory Clouds.fromMap(Map<String, dynamic> json) => Clouds(
        all: json["all"],
      );
}
