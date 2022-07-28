import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mercado/src/core/constants/constants.dart';

import '../../../core/shared/components.dart';

class RestorePasswordBody extends StatelessWidget {
  RestorePasswordBody({Key? key}) : super(key: key);

  TextEditingController restorePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                'A four digit code will be sent to your phone to restore your password.',
                style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.visible,
                    height: 1.5),
              ),
              const SizedBox(height: 25), //Username Form Field
              defaultFormField(
                controller: restorePasswordController,
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
                  //Register Button
                  defaultButton(
                    isUpperCase: true,
                    function: () {},
                    text: 'Continue',
                    width: 150,
                    height: 40,
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
