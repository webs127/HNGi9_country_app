import 'package:country/presentation/resources/color_manager.dart';
import 'package:country/presentation/views/details/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../models/country_api_model.dart';
import '../../services/country_api_request.dart';

class HTTPWidget extends StatefulWidget {
  final String text;
  final HTTPRequest<List<Name>> request;
  const HTTPWidget({required this.request, required this.text, Key? key})
      : super(key: key);

  @override
  State<HTTPWidget> createState() => _HTTPWidgetState();
}

class _HTTPWidgetState extends State<HTTPWidget> {
  late final Future<List<Name>> futureItem;
  @override
  void initState() {
    super.initState();
    futureItem = widget.request.execute();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Name>>(
        future: futureItem,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Expanded(
              child: ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => DetailsScreen(
                                      population: snapshot.data![i].population
                                          .toString(),
                                      region: snapshot.data![i].region,
                                  capital: snapshot.data![i].capital![0],
                                  image1: snapshot.data![i].flag.png,
                                  image2: snapshot.data![i].coatOfArms.png,
                                  title: snapshot.data![i].name.official,
                                  area: snapshot.data![i].area.toString(),
                                  timezone: snapshot.data![i].timezone![0],

                                    )));
                      },
                      leading: CircleAvatar(
                        child: Image.network(
                          "${snapshot.data![i].flag.png}",
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text("${snapshot.data![i].name.official}"),
                      subtitle: Text("${snapshot.data![i].capital?[0]}"),
                    );
                  }),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          }
          return const Center(
              child: SpinKitCircle(
            color: Colors.blue,
          ));
        });
  }
}
