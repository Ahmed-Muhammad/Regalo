import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/api/dio_helper.dart';
import '../../../../models/products_model.dart';
import '../../../../models/products_model.dart';
import '../../screens/account_page.dart';
import '../../screens/cart_page.dart';
import '../../screens/notification_page.dart';
import '../../screens/product_page.dart';
import 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(HomeInitial());

  static MainCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreens = [
    ProductPage(),
    const CartPage(),
    const AccountPage(),
    const NotificationPage(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }

  //--------------products details----------------
  ProductsModel? productsModel;

  void getProductsDetails() {
    emit(LoadingProductsDetailsState());

    DioHelper.postData(
      data: {},
      url: 'allitems',
    ).then((value) {
      productsModel = ProductsModel.fromJson(value?.data);
      print('----------------------------------------------');
      print(value?.data);
      print(productsModel?.data![2].title);

      print('----------------------------------------------');

      emit(SuccessProductsDetailsState());
    }).catchError((error) {
      print('Error in Get products details ==========> ${error.toString()}');

      emit(ErrorProductsDetailsState());
    });
  }
}
