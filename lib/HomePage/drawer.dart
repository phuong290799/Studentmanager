import 'package:flutter/material.dart';
import 'package:flutter_student/Style/colors.dart';
import 'package:flutter_student/Style/style.dart';
class OpenDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: AppColors.BACKGROUND,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/images/image1.jpg",height: 75,width: 75,),
                    Text(
                      "admin",
                      style: AppThemes.Text16Medium,
                    ),
                    Text(
                      "phuong29071999.com",
                      style: AppThemes.Text14Medium,
                    ),
                  ],
                ),
              )),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.home),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "My Home",
                  style: AppThemes.Text16,
                )
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.post_add_outlined),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Add Student",
                  style: AppThemes.Text16,
                )
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.connect_without_contact),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Contact Us",
                  style: AppThemes.Text16,
                )
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.settings),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Setting",
                  style: AppThemes.Text16,
                )
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.exit_to_app),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Sign Out",
                  style: AppThemes.Text16,
                )
              ],
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
