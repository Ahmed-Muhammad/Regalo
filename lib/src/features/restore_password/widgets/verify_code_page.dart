import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/constants/constants.dart';
import '../../../core/shared/components.dart';
import 'change_password.dart';

class VerifyCodePage extends StatelessWidget {
  VerifyCodePage({Key? key}) : super(key: key);
  TextEditingController restoreVerifyCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                    controller: restoreVerifyCodeController,
                    type: TextInputType.number,
                    maxLength: 6,
                    label: 'Code',
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
  }
}
