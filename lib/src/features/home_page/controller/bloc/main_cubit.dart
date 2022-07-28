import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../screens/account_page.dart';
import '../../screens/cart_page.dart';
import '../../screens/home_page.dart';
import '../../screens/notification_page.dart';
import '../../screens/product_page.dart';
import 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(HomeInitial());

  static MainCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreens = [
    const ProductPage(),
    const CartPage(),
    const AccountPage(),
    const NotificationPage(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }
}
