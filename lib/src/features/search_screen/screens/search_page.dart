import 'package:flutter/material.dart';

import '../widgets/search_body.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: const SearchBody(),
    );
  }
}
