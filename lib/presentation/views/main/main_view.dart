import 'package:country/services/country_api_request.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/country_api_model.dart';
import '../../widgets/http_widget.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final String url = 'https://restcountries.com/v3.1/allscd ';
  final input = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Text("Explore"),
            SizedBox(
              width: 5,
            ),
            Text(
              ".",
              style: TextStyle(color: Colors.red, fontSize: 26),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.filter_list))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              textInputAction: TextInputAction.go,
              controller: input,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search Country",
                  border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 18, right: 18, top: 10, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50))
                        ),
                        builder: (BuildContext context) {
                          return const SizedBox(
                            width: double.infinity,
                            height: 500,
                          );
                        });
                  },
                  child: Container(
                    width: 90,
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(color: Colors.grey),
                        borderRadius: const BorderRadius.horizontal(
                            left: const Radius.circular(25),
                            right: const Radius.circular(25),
                        )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.circle,
                          size: 30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "EN",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return const SizedBox(
                            width: double.infinity,
                            height: 500,
                            child: Center(
                              child: Text("data"),
                            ),
                          );
                        });
                  },
                  child: Container(
                    width: 90,
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.filter_alt_outlined, size: 30),
                        Text(
                          "Filter",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          HTTPWidget(
            request: CountryDataRequest(
              url: url,
            ),
            text: input.text,
          )
        ],
      ),
    ));
  }
}

//HTTPWidget(request: CountryDataRequest(url: url))
