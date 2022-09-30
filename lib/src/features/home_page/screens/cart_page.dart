import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:regalo/src/features/home_page/controller/bloc/main_cubit.dart';

import '../controller/bloc/main_state.dart';
import '../widgets/cart_page_body.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
        var mainCubit = MainCubit.get(context);
        return CartBody();
      },
    );
  }
}
