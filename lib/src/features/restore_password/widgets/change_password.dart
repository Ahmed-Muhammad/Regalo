import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/constants/constants.dart';
import '../../../core/shared/components.dart';

class ChangePasswordPage extends StatelessWidget {
  ChangePasswordPage({Key? key}) : super(key: key);
  TextEditingController restorePasswordController = TextEditingController();
  TextEditingController restorePasswordConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                //Username Form Field

                const SizedBox(height: 25), //Username Form Field
                defaultFormField(
                  controller: restorePasswordController,
                  type: TextInputType.number,
                  maxLength: 6,
                  label: 'New password',
                  prefix: FontAwesomeIcons.phone,
                  prefixIconSize: 15,
                ),
                const SizedBox(height: 25),
                defaultFormField(
                  controller: restorePasswordConfirmController,
                  type: TextInputType.number,
                  maxLength: 6,
                  label: 'Confirm new password',
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
                      function: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
