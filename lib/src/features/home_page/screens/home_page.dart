import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:regalo/src/features/home_page/controller/bloc/main_cubit.dart';

import '../../../core/shared/components.dart';
import '../../drawer/screens/drawer.dart';
import '../../search_screen/screens/search_page.dart';
import '../../search_screen/widgets/search_body.dart';
import '../controller/bloc/main_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
        var homeCubit = MainCubit.get(context);
        return Scaffold(
          drawer: homeCubit.currentIndex == 0 ? const MyDrawer() : null,
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
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(),
                  );
                },
                icon: const Icon(
                  FontAwesomeIcons.search,
                  size: 18,
                ),
              ),
            ],
          ),
          body: homeCubit.bottomScreens[homeCubit.currentIndex],
        );
      },
    );
  }
}
