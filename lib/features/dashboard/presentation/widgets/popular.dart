import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_day_worker/core/theme/app_color.dart';

class Popular extends StatelessWidget {
  const Popular({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      "https://t4.ftcdn.net/jpg/01/16/90/67/360_F_116906786_NlPBEUV2L4w2tGfyGSh9ceuIDRggyoFC.jpg",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQICaJ0d75YCNmLBn4m6l9RWviCZV-i-Bf8bA&s",
      "https://cdn.prod.website-files.com/68902787039636ec8ca894c6/68902787039636ec8ca8a7b6_66c6ab377a159d9f4624008f_professional-house-painter.jpeg",
    ];
    final List<String> names = ["Plumber", "Carpenter", "Painter"];

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
              Text("Popular Near you"),
              Text(
                "See All",
                style: GoogleFonts.inter(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
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
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        images[index],
                        height: 130,
                        width: 200,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      height: 130,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.black.withValues(alpha: 0.9),
                            Colors.black.withValues(alpha: 0.5),
                            AppColors.white.withValues(alpha: 0.2),
                            AppColors.white.withValues(alpha: 0.2),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                      margin: EdgeInsets.only(left: 8, top: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: AppColors.white.withValues(alpha: 0.4),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "4.5 ",
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 12,
                            ),
                          ),
                          Icon(Icons.star, color: Colors.yellow, size: 16),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      left: 8,
                      child: Text(
                        names[index],
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
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
