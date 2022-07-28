import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mercado/src/features/login_page/screens/login_page.dart';

import '../../../core/constants/constants.dart';
import '../../../core/shared/components.dart';
import '../controller/cubit/register_cubit.dart';
import '../controller/cubit/register_state.dart';

class RegisterBody extends StatelessWidget {
  RegisterBody({Key? key}) : super(key: key);

  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {},
      builder: (context, state) {
        var registerCubit = RegisterCubit.get(context);
        return SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  // Logo
                  Image.asset('assets/images/login.png'),
                  const SizedBox(height: 15), //Username Form Field
                  defaultFormField(
                    controller: userNameController,
                    label: 'Username',
                    prefix: FontAwesomeIcons.user,
                    prefixIconSize: 15,
                  ),
                  const SizedBox(height: 15),
                  defaultFormField(
                    maxLength: 11,
                    controller: phoneController,
                    type: TextInputType.phone,
                    label: 'Phone',
                    prefix: FontAwesomeIcons.phone,
                    prefixIconSize: 15,

                  ),
                  const SizedBox(height: 15),
                  //Password Form Field
                  defaultFormField(
                    maxLength: 15,
                    controller: passwordController,
                    label: 'Password',
                    prefix: FontAwesomeIcons.lock,
                    prefixIconSize: 15,
                    obscureText: registerCubit.obscureText,
                    suffix: registerCubit.suffix,
                    suffixIconSize: 15,
                    suffixPressed: () => registerCubit.changePasswordVisibility(),
                  ),
                  const SizedBox(height: 15),
                  defaultFormField(
                    maxLength: 15,
                    controller: confirmPasswordController,
                    label: 'Confirm Password',
                    prefix: FontAwesomeIcons.lock,
                    prefixIconSize: 15,
                    obscureText: registerCubit.obscureTextConfirm,
                    suffix: registerCubit.suffixConfirm,
                    suffixIconSize: 15,
                    suffixPressed: () => registerCubit.changePasswordVisibilityConfirm(),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Register Button
                      defaultButton(
                        isUpperCase: true,
                        function: () {},
                        text: 'Register',
                        width: 150,
                        height: 40,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  TextButton(
                    onPressed: () {
                      navigateToPageAndFinish(context, pageName: const LoginPage());
                    },
                    child: const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Have account?  ',
                            style: TextStyle(color: secondaryColor),
                          ),
                          TextSpan(
                            text: 'Login instead',
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
