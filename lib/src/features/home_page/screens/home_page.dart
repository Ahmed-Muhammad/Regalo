import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mercado/src/features/home_page/controller/bloc/main_cubit.dart';

import '../controller/bloc/main_state.dart';
import '../widgets/cart_page_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
        var homeCubit = MainCubit.get(context);
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: homeCubit.currentIndex,
            onTap: (index) {
              homeCubit.changeBottom(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.cartShopping),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.users),
                label: 'My account',
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.bell),
                label: 'Notification',
              ),
            ],
          ),
          body: homeCubit.bottomScreens[homeCubit.currentIndex],
        );
      },
    );
  }
}
