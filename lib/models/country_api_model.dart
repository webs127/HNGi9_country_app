class NameData {
  final String? common;
  final String? official;

  NameData({required this.common, required this.official});

  factory NameData.fromJson(Map<String, dynamic> json) {
    return NameData(official: json["official"], common: json["common"]);
  }
}

// class Language {
//   final String? language;
//   Language({required this.language});

//   factory Language.fromJson(Map<String, dynamic> json) => Language(language: json["la"]);
// }

class Flags {
  final String? png;
  final String? svg;

  Flags({required this.png, required this.svg});

  factory Flags.fromJson(Map<String, dynamic> json) => Flags(png: json["png"], svg: json["svg"]);
}

class CoatOfArms {
  final String? png;
  final String? svg;

  CoatOfArms({required this.png, required this.svg});

  factory CoatOfArms.fromJson(Map<String, dynamic> json) => CoatOfArms(png: json["png"], svg: json["svg"]);
}

class Name {
  final NameData name;
  final List? capital;
  final String? region;
  final int? population;
  final List? timezone;
  final List? continent;
  final double? area;
  final Flags flag;
  final CoatOfArms coatOfArms;
  Name({required this.name, required this.capital, required this.region, required this.population, required this.timezone, required this.continent, required this.area, required this.flag, required this.coatOfArms});

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
        name: NameData.fromJson(json["name"]),
        capital: json["capital"] ?? "Unknown",
        region: json["region"],
        population: json["population"],
        timezone: json["timezones"],
        continent: json["continents"],
        area: json["area"],
        flag: Flags.fromJson(json["flags"]),
        coatOfArms: CoatOfArms.fromJson(json["coatOfArms"])
    );
  }
}
