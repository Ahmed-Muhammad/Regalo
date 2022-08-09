import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/constants/constants.dart';
import '../../../core/shared/components.dart';
import '../controller/bloc/restore_password_cubit.dart';
import '../controller/bloc/restore_password_state.dart';
import 'change_password.dart';

class VerifyCodePage extends StatelessWidget {
  VerifyCodePage({
    Key? key,
    required this.apiCode,
  }) : super(key: key);
  TextEditingController userCode = TextEditingController();
  final String apiCode;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RestorePasswordCubit, RestorePasswordState>(
      listener: (context, state) {},
      builder: (context, state) {
        RestorePasswordCubit restorePasswordCubit = RestorePasswordCubit.get(context);

        return MaterialApp(
          home: Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      // Logo
                      Image.asset('assets/images/login.png'),
                      const SizedBox(height: 20),
                      //Username Form Field
                      const Text(
                        'Please enter the code sent to you.',
                        style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.visible,
                            height: 1.5),
                      ),
                      const SizedBox(height: 25), //Username Form Field
                      defaultFormField(
                          controller: userCode,
                          validate: (p0) {
                            if (userCode.text != apiCode) {
                              return 'wrong code';
                            } else {
                              return null;
                            }

                          },
                          type: TextInputType.number,
                          maxLength: 6,
                          label: 'Code',
                          prefix: FontAwesomeIcons.phone,
                          prefixIconSize: 15),

                      const SizedBox(height: 25),
                      //Password Form Field

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Continue button
                          defaultButton(
                            isUpperCase: true,
                            text: 'Continue',
                            width: 150,
                            height: 40,
                            function: () {
                              navigateToPage(context, pageName: ChangePasswordPage());
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
