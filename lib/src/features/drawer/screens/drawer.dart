import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:regalo/src/core/shared/components.dart';
import 'package:regalo/src/features/login_page/screens/login_page.dart';

import '../../../core/constants/constants.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Stack(
            children: const [
              SizedBox(
                height: 200,
                width: 310,
              ),
              Positioned(
                left: 30,
                top: 20,
                child: Image(image: AssetImage('assets/images/logoragalo.png')),
              ),
              Positioned(
                top: 85,
                child: Image(image: AssetImage('assets/images/drawer.png')),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ListTile(
              trailing: const Icon(FontAwesomeIcons.solidHeart, color: secondaryColor, size: 20),
              title: const Text('المفضله', style: TextStyle(color: primaryColor, fontSize: 17)),
              onTap: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ListTile(
              trailing: const Icon(FontAwesomeIcons.barsProgress, color: secondaryColor, size: 20),
              title: const Text('طلباتي', style: TextStyle(color: primaryColor, fontSize: 17)),
              onTap: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ListTile(
              trailing:
                  const Icon(FontAwesomeIcons.solidContactCard, color: secondaryColor, size: 20),
              title: const Text('تواصل معنا', style: TextStyle(color: primaryColor, fontSize: 17)),
              onTap: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ListTile(
              trailing: const Icon(FontAwesomeIcons.circleInfo, color: secondaryColor, size: 20),
              title: const Text('من نحن', style: TextStyle(color: primaryColor, fontSize: 17)),
              onTap: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ListTile(
              trailing: const Icon(FontAwesomeIcons.signOut, color: secondaryColor, size: 20),
              title: const Text(
                'تسجيل الخروج',
                style: TextStyle(color: primaryColor, fontSize: 17),
              ),
              onTap: () {
                navigateToPageAndFinish(context, pageName: const LoginPage());
              },
            ),
          ),
        ],
      ),
    );
  }
}
