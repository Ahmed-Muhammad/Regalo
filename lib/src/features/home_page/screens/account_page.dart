import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mercado/src/features/home_page/controller/bloc/main_cubit.dart';

import '../controller/bloc/main_state.dart';
import '../widgets/account_page_body.dart';
import '../widgets/cart_page_body.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
        var mainCubit = MainCubit.get(context);
        return AccountBody();
      },
    );
  }
}
