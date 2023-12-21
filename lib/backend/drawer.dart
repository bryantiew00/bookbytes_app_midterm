import 'package:bookbyte/buyer/user.dart';
import 'package:bookbyte/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:bookbyte/pages/mainpage.dart';
import 'package:bookbyte/backend/route.dart';

class MyDrawer extends StatefulWidget {
  final String page;
  final User userdata;
  
  const MyDrawer({super.key, required this.page, required this.userdata});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            currentAccountPicture: const CircleAvatar(
                foregroundImage: AssetImage('assets/images/profile.png'),
                backgroundColor: Colors.white),
            accountName: Text(widget.userdata.userName.toString()),
            accountEmail: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.userdata.userEmail.toString()),
                    const Text("RM145.80")
                  ]),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.money),
            title: const Text('Books'),
            onTap: () {
              Navigator.pop(context);
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (content) => const MainPage()));
              if (widget.page.toString() == "books") {
                //  Navigator.pop(context);
                return;
              }
              Navigator.pop(context);
              Navigator.push(
                  context,
                  EnterExitRoute(
                      exitPage: MainPage(
                        userdata: widget.userdata,
                      ),
                      enterPage: MainPage(userdata: widget.userdata)));
            },
          ),
          ListTile(
            leading: const Icon(Icons.verified_user),
            title: const Text('My Account'),
            onTap: () {
              Navigator.pop(context);
              if (widget.page.toString() == "account") {
                //  Navigator.pop(context);
                return;
              }
              Navigator.pop(context);

              // Navigator.push(context,
              //     MaterialPageRoute(builder: (content) => const ProfilePage()));
              Navigator.push(
                  context,
                  EnterExitRoute(
                      exitPage: ProfilePage(userdata: widget.userdata),
                      enterPage: ProfilePage(userdata: widget.userdata)));
            },
          ),
          const Divider(
            color: Colors.blueGrey,
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}