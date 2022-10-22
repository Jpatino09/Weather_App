import 'dart:convert';

class LocalNames {
  LocalNames({
    required this.oc,
    required this.ar,
    required this.es,
    required this.fa,
    required this.mk,
    required this.pt,
    required this.ru,
    required this.uk,
    required this.en,
    required this.ur,
  });

  String oc;
  String ar;
  String es;
  String fa;
  String mk;
  String pt;
  String ru;
  String uk;
  String en;
  String ur;

  factory LocalNames.fromJson(String str) =>
      LocalNames.fromMap(json.decode(str));

  factory LocalNames.fromMap(Map<String, dynamic> json) => LocalNames(
        oc: json["oc"],
        ar: json["ar"],
        es: json["es"],
        fa: json["fa"],
        mk: json["mk"],
        pt: json["pt"],
        ru: json["ru"],
        uk: json["uk"],
        en: json["en"],
        ur: json["ur"],
      );
}
