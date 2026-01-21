import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/routes/route_names.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  void _onTapSeeAll(BuildContext context) {
    Navigator.pushNamed(context, RouteNames.viewAllCategories);
  }

  @override
  Widget build(BuildContext context) {
    final List<IconData> images = [
      Icons.car_repair,
      Icons.cleaning_services,
      Icons.plumbing,
      Icons.carpenter,
      Icons.electrical_services,
      Icons.account_tree,
      Icons.accessible_rounded,
      Icons.electric_bike_sharp,
      Icons.safety_check,
      Icons.help_outline,
    ];
    final List<String> names = [
      "Repair",
      "Clean",
      "Plumb",
      "CPenter",
      "Electra",
      "Tree",
      "Help",
      "Bike",
      "Safety",
      "Others",
    ];
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16,
            top: 20,
            bottom: 8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Category"),
              GestureDetector(
                onTap: () => _onTapSeeAll(context),
                child: Text(
                  "See All",
                  style: GoogleFonts.inter(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: List.generate(
              images.length,
              (index) => Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        images[index],
                        size: 30,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      names[index],
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
