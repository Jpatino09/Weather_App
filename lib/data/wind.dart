import 'dart:convert';

class Wind {
  Wind({
    required this.speed,
  });

  double speed;

  factory Wind.fromJson(String str) => Wind.fromMap(json.decode(str));

  factory Wind.fromMap(Map<String, dynamic> json) => Wind(
        speed: json["speed"],
      );
}
