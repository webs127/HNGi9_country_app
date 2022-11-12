import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:country/models/country_api_model.dart';

abstract class HTTPRequest<T> {
  Future<T> execute();
}

class CountryDataRequest implements HTTPRequest<List<Name>> {
  final String url;
  CountryDataRequest({required this.url});
  @override
  Future<List<Name>> execute() async {
    final response = await http.get(Uri.parse(url));
    List<dynamic> data = jsonDecode(response.body);
    if (response.statusCode != 200) {
      throw http.ClientException("Oh Darn");
    }
    List<Name> list = data.map((e) => Name.fromJson(e)).toList();
    print(list);
    return list;
  }
}

