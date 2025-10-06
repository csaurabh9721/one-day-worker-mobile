import 'package:flutter/material.dart';

import '../widgets/bottom_nav_bar.dart';
import '../widgets/category.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/popular.dart';
import '../widgets/sliders.dart';
import '../widgets/worker_list.dart';



class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Header(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 20),
              physics: const BouncingScrollPhysics(),
              children: [Sliders(), Category(), Popular(),WorkerList()],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
