import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final String? population;
  final String? region;
  final String? capital;
  final String? image1;
  final String? image2;
  final String? title;
  final String? area;
  final String? timezone;

  const DetailsScreen({Key? key, required this.timezone, required this.area, required this.title, required this.image1, required this.image2, required this.population, required this.region, required this.capital}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    List images = [widget.image1, widget.image2];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("${widget.title}"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider.builder(
                  itemCount: images.length,
                  itemBuilder: (context, index, realIndex) {
                   return Container(
                     margin: const EdgeInsets.only(right: 10),
                     width: 500,
                     height: 180,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(20),
                     ),
                     child: Image.network(images[index], fit: BoxFit.contain,)
                   );
                  },
                  options: CarouselOptions(
                    height: 280,
                    viewportFraction: 1,
                    autoPlay: true
                  )),
              const SizedBox(height: 30,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Population: ", style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                  ),),
                  Text("${widget.population}", style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400
                  ),),
                ],
              ),
              const SizedBox(height: 30,),
              Row(
                children: [
                  const Text("Region: ", style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                  ),),
                  Text("${widget.region}", style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400
                  ),),
                ],
              ),
              const SizedBox(height: 30,),
              Row(
                children: [
                  const Text("Capital: ", style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                  ),),
                  Text("${widget.capital}", style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400
                  ),),
                ],
              ),
              const SizedBox(height: 30,),
              Row(
                children: [
                  const Text("Area: ", style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                  ),),
                  Text("${widget.area}", style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400
                  ),),
                ],
              ),
              const SizedBox(height: 30,),
              Row(
                children: [
                  const Text("TimeZone: ", style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                  ),),
                  Text("${widget.timezone}", style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400
                  ),),
                ],
              ),
              const SizedBox(height: 30,),

            ],
          ),
        ),
      ),
    );
  }
}
