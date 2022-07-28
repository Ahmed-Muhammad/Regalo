import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mercado/src/features/home_page/screens/home_page.dart';

import '../../../core/constants/constants.dart';
import '../../../core/shared/components.dart';
import '../../restore_password/screens/restore_password.dart';
import '../../register_page/screens/register_page.dart';
import '../controller/cubit/login_cubit.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key, required this.height}) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        var loginCubit = LoginCubit.get(context);
        return SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: height),
                  // Logo
                  Image.asset('assets/images/login.png'),
                  SizedBox(height: height),
                  //Username Form Field
                  defaultFormField(
                    controller: userNameController,
                    label: 'Username',
                    prefix: FontAwesomeIcons.user,
                    prefixIconSize: 15,
                  ),
                  SizedBox(
                    height: height,
                  ),
                  //Password Form Field
                  defaultFormField(
                    maxLength: 15,
                    controller: passwordController,
                    label: 'Password',
                    prefix: FontAwesomeIcons.lock,
                    prefixIconSize: 15,
                    obscureText: loginCubit.obscureText,
                    suffix: loginCubit.suffix,
                    suffixIconSize: 15,
                    suffixPressed: () => loginCubit.changePasswordVisibility(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      //Forget your password?
                      TextButton(
                        onPressed: () {
                          navigateToPage(context, pageName: RestorePassword());
                        },
                        child: const Text('Forget your password?'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //'Sign in' Button
                      defaultButton(
                        function: () {},
                        text: 'Sign in',
                        width: 150,
                        height: 40,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height,
                  ),
                  //Skip login button
                  defaultTextButton(
                      text: 'Skip login',
                      function: () {
                        navigateToPageAndFinish(context, pageName: const HomePage());
                      },
                      isUpperCase: false),
                  SizedBox(
                    height: height,
                  ),
                  //Register button
                  TextButton(
                    onPressed: () {
                      navigateToPage(context, pageName: const RegisterPage());
                    },
                    child: const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Don\'t have account?  ',
                            style: TextStyle(color: secondaryColor),
                          ),
                          TextSpan(
                            text: 'Register now',
                            style: TextStyle(color: primaryColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
