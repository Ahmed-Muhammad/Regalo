import 'package:flutter/material.dart';

import '../widgets/register_body.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
        body: RegisterBody() ,
    );
  }
}
