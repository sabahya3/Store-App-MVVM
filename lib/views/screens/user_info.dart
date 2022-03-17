import 'package:flutter/material.dart';
import 'package:story/views/components/custom_list_tile.dart';
import 'package:story/views/components/custom_text.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return  Scaffold(
          body: Container(
            width: width,
            color: Color(0xff29D697).withOpacity(0.5),
            child: Padding(
              padding: EdgeInsets.only(left: width * 0.08, top: height * 0.13),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage("assets/images/me.jpg"),
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    CustomText(
                        fontColor: Colors.black,
                        fontSize: 18,
                        txt: 'Ahmed El Sabahy',
                        fontWeight: FontWeight.bold),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    CustomListTile(icon: Icons.person, txt: 'My Profile'),
                    CustomListTile(icon: Icons.chat, txt: 'Messages'),
                    CustomListTile(icon: Icons.calendar_month, txt: 'Calender'),
                    CustomListTile(icon: Icons.bookmark, txt: 'Bookmark'),
                    CustomListTile(icon: Icons.email, txt: 'Contact Us'),
                    CustomListTile(icon: Icons.settings, txt: 'Settings'),
                    CustomListTile(icon: Icons.logout_outlined, txt: 'Sign Out'),
                  ],
                ),
              ),
            ),
          ),
        );
  }
}