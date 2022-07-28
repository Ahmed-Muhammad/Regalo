import 'package:flutter/material.dart';

import '../widgets/restore_password_body.dart';

class RestorePassword extends StatelessWidget {
  const RestorePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: RestorePasswordBody(),
    );
  }
}
