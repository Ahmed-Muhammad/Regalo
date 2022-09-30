import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:regalo/src/core/constants/constants.dart';
import 'package:regalo/src/features/restore_password/widgets/change_password.dart';

import '../../../core/shared/components.dart';
import '../controller/bloc/restore_password_cubit.dart';
import '../controller/bloc/restore_password_state.dart';
import 'verify_code_page.dart';

class RestorePasswordBody extends StatelessWidget {
  RestorePasswordBody({Key? key}) : super(key: key);

  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RestorePasswordCubit, RestorePasswordState>(
      listener: (context, state) {},
      builder: (context, state) {
        RestorePasswordCubit restorePasswordCubit = RestorePasswordCubit.get(context);
        return SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  // Logo
                  Image.asset('assets/images/login.png'),
                  const SizedBox(height: 20), //Username Form Field
                  const Text(
                    'Please enter your phone number below. '
                    'A Six digit code will be sent to your phone to restore your password.',
                    style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.visible,
                        height: 1.5),
                  ),
                  const SizedBox(height: 25), //Username Form Field
                  defaultFormField(
                    controller: phoneController,
                    type: TextInputType.phone,
                    maxLength: 11,
                    label: 'Phone',
                    prefix: FontAwesomeIcons.phone,
                    prefixIconSize: 15,
                  ),
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
                          restorePasswordCubit.sendCodeToPhoneByLocalNotification(
                            phone: phoneController.text,
                            navigate: true,
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
