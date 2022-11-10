class CountryData {
  final String? common;
  final String? official;

  CountryData({required this.common, required this.official});

  factory CountryData.fromJson(Map<String, dynamic> json) =>
      CountryData(common: json["common"], official: json["official"]);
}

class Name {
  final CountryData countryData;
  final int population;
  final String region;
  final List capital;
  final double area;
  final List timezone;
  final List continents;
  final Car car;
  final Language language;
  final Flag flag;
  final CoatOfArm coatOfArm;
  Name(
      {required this.countryData,
      required this.population,
      required this.region,
      required this.capital,
      required this.area,
      required this.timezone,
      required this.continents,
      required this.car,
      required this.language,
      required this.flag,
      required this.coatOfArm});

  factory Name.fromJson(Map<String, dynamic> json) => Name(
      countryData: CountryData.fromJson(json["name"]),
      population: json["population"],
      region: json["region"],
      capital: json["capital"],
      area: json["area"],
      timezone: json["timezones"],
      continents: json["continents"],
      car: Car.fromJson(json["car"]),
      language: Language.fromJson(json["languages"]),
      flag: Flag.fromJson(json["flags"]),
      coatOfArm: CoatOfArm.fromJson(json["coatOfArms"]));
}

class Car {
  final String side;

  Car({required this.side});

  factory Car.fromJson(Map<String, dynamic> json) => Car(side: json["side"]);
}

class Language {
  final String? eng;

  Language({required this.eng});

  factory Language.fromJson(Map<String, dynamic> json) =>
      Language(eng: json["eng"]);
}

class Flag {
  final String url;

  Flag({required this.url});

  factory Flag.fromJson(Map<String, dynamic> json) => Flag(url: json["png"]);
}

class CoatOfArm {
  final String? url;

  CoatOfArm({required this.url});

  factory CoatOfArm.fromJson(Map<String, dynamic> json) =>
      CoatOfArm(url: json["svg"]);
}

class CountryList {
  final List<Name> name;

  CountryList({required this.name});

  factory CountryList.fromList(List<dynamic> list) {
    List<Name> dataList = list.map((e) => Name.fromJson(e)).toList();
    return CountryList(name: dataList);
  }
}
