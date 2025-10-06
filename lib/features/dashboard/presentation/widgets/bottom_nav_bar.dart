import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/navigationCubit/navigation_cubit.dart';
import '../blocs/navigationCubit/navigation_state.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final List<IconData> icons = [
      Icons.home,
      Icons.favorite,
      Icons.save_rounded,
      Icons.person,
    ];
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return Container(
          height: 60,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              icons.length,
              (index) => InkWell(
                onTap: () {
                  context.read<NavigationCubit>().changeIndex(index);
                },
                child: Icon(
                  icons[index],
                  size: 30,
                  color: state.selectedIndex == index
                      ? Colors.white
                      : Colors.grey.shade400,
                ),
              ),
            ).toList(),
          ),
        );
      },
    );
  }
}
