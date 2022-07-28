import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/constants/constants.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          SizedBox(
            height: 180,
            width: 310,
            child: ListView.builder(
              itemBuilder: (context, index) => const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  child: ClipOval(
                    child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/avatar.jpg'),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage('assets/images/cover.jpg')),
                ),
                accountEmail: Text(
                  'Ahmad M. Hassanien',
                  style: TextStyle(fontWeight: FontWeight.w900, color: primaryColor),
                ),
                accountName: Text(
                  'Welcome',
                  style: TextStyle(color: secondaryColor),
                ),
                arrowColor: Colors.red,
                currentAccountPictureSize: Size(70, 70),
              ),
              itemCount: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ListTile(
              trailing: const Icon(FontAwesomeIcons.solidHeart, color: secondaryColor, size: 20),
              title: const Text('Favorites', style: TextStyle(color: primaryColor, fontSize: 17)),
              onTap: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ListTile(
              trailing: const Icon(FontAwesomeIcons.barsProgress, color: secondaryColor, size: 20),
              title: const Text('Orders', style: TextStyle(color: primaryColor, fontSize: 17)),
              onTap: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ListTile(
              trailing:
                  const Icon(FontAwesomeIcons.solidContactCard, color: secondaryColor, size: 20),
              title: const Text('Contact us', style: TextStyle(color: primaryColor, fontSize: 17)),
              onTap: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ListTile(
              trailing: const Icon(FontAwesomeIcons.circleInfo, color: secondaryColor, size: 20),
              title: const Text('About', style: TextStyle(color: primaryColor, fontSize: 17)),
              onTap: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ListTile(
              trailing: const Icon(FontAwesomeIcons.signOut, color: secondaryColor, size: 20),
              title: const Text('Log out', style: TextStyle(color: primaryColor, fontSize: 17)),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
