import 'package:country/services/country_api_request.dart';
import 'package:flutter/material.dart';
import '../../widgets/http_widget.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final String url = 'https://restcountries.com/v3.1/all';
  final input = TextEditingController();
  List timezones = [
    "UTC-04:00",
    "UTC-03:00",
    "UTC-10:00",
    "UTC-12:00",
    "UTC-11:00",
    "UTC-07:00",
    "UTC-08:00",
    "UTC-05:00",
    "UTC-08:00",
    "UTC-09:00",
  ];
  List timezone2 = [
    "Continent",
    "Region",

  ];
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
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
                        ),
                        builder: (BuildContext context) {
                          return SizedBox(
                            width: double.infinity,
                            height: 500,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("Languages", style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600
                                      ),),
                                      IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                          icon: const Icon(Icons.cancel_presentation)
                                      )
                                    ],
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                      itemCount: timezones.length,
                                        itemBuilder: (context,i) {
                                        return ListTile(
                                          title: Text(timezones[i]),
                                        );
                                        }),
                                  ),
                                ],
                              ),
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
                        borderRadius: const BorderRadius.horizontal(
                            left: Radius.circular(25),
                            right: Radius.circular(25),
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
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
                        ),
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            width: double.infinity,
                            height: 200,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("Filter", style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600
                                      ),),
                                      IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: const Icon(Icons.cancel_presentation)
                                      )
                                    ],
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                        itemCount: timezone2.length,
                                        itemBuilder: (context,i) {
                                          return ListTile(
                                            title: Text(timezone2[i]),
                                          );
                                        }),
                                  ),
                                ],
                              ),
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
