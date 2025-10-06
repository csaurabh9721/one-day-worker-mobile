import 'package:flutter/material.dart';

import '../../../../core/theme/app_color.dart';

class WorkerList extends StatelessWidget {
  const WorkerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 16.0,
            right: 16,
          ),
          child: Text("Pick for you"),
        ),
        ...List.generate(
        3,
        (index) => Card(
          elevation: 2,
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    index == 0
                        ? "https://www.goconstruct.org/media/cv0ikdh1/joiner-ss1704723019.jpg?width=510&height=332&format=WebP&quality=75&v=1db885fa3742490"
                        : index == 1
                        ? "https://thumbs.dreamstime.com/b/serious-male-teacher-formal-wear-holding-wooden-pointer-front-chalkboard-equations-155809695.jpg"
                        : "https://img.freepik.com/premium-photo/black-afro-man-looking-excited-surprised-pointing-side-painting-home-concept_1194-385344.jpg?semt=ais_hybrid&w=740&q=80",
                    height: 100,
                    width: 100,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'User Name',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 2,
                            ),
                            margin: EdgeInsets.only(left: 8, top: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: AppColors.black.withValues(alpha: 0.3),
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
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 16,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '₹200/hr - ₹1000/day',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '3+ year Experience',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                      Text('Driver, Helper, Teacher'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )],
    );
  }
}
