import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Sliders extends StatelessWidget {
  const Sliders({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final List<String> images = [
      "https://t3.ftcdn.net/jpg/04/82/40/42/360_F_482404253_vh9VqZ6VCbadcfnGQM9yZRIry5yhf8WR.jpg",
      "https://thumbs.dreamstime.com/b/happy-worker-handyman-jack-all-trades-builder-construction-tools-happy-worker-handyman-jack-all-trades-builder-211803095.jpg",
      "https://media.istockphoto.com/id/1272136549/photo/industrial-worker-at-factory.jpg?s=612x612&w=0&k=20&c=3IfTV81wmujlXmiK8NQa-IJKyiY4GEprSpNVZ_tnQds=",
    ];
    return SizedBox(
      height: 160,
      child: CarouselSlider(
        items: images
            .map(
              (e) => ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  e,
                  fit: BoxFit.fill,
                  height: 10,
                  width: size.width - 30,
                ),
              ),
            )
            .toList(),
        options: CarouselOptions(
          height: 400,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          onPageChanged: (index, reason) {},
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
