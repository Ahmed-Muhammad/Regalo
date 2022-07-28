import 'package:flutter/material.dart';

import '../../../core/responsive/responsive.dart';
import '../widgets/login_body.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobile: LoginBody(height: 30),
        tablet: LoginBody(height: 50),
        website: LoginBody(height: 90),
      ),
    );
  }
}
