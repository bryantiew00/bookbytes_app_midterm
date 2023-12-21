import 'package:bookbyte/backend/drawer.dart';
import 'package:bookbyte/pages/userloginpage.dart';
import 'package:bookbyte/pages/userregisterpage.dart';
import 'package:flutter/material.dart';
import 'package:bookbyte/buyer/user.dart';

class ProfilePage extends StatefulWidget {
  final User userdata;
  const ProfilePage({super.key, required this.userdata});

  @override
  State<ProfilePage> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  late double screenWidth, screenHeight;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.black),
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "My Account",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 35,
                ),
              ],
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(2.0),
              child: Container(
                color: Colors.blueGrey,
                height: 1.5,
              ),
            )),
        drawer: MyDrawer(
          page: 'Account',
          userdata: widget.userdata,
        ),
        body: Center(
          child: Column(children: [
            Container(
              height: screenHeight * 0.3,
              padding: const EdgeInsets.all(5),
              child: Card(
                  child: Row(children: [
                Container(
                  padding: const EdgeInsets.all(7),
                  width: screenWidth * 0.5,
                  height: screenHeight * 0.5,
                  child: Image.asset(
                    'assets/images/profile.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Expanded(
                    flex: 7,
                    child: Column(
                      children: [
                        Text(
                          widget.userdata.userName.toString(),
                          style: const TextStyle(fontSize: 24),
                        ),
                        const Divider(
                          color: Colors.blueGrey,
                        )
                      ],
                    ))
              ])),
            ),
            Container(
              height: screenHeight * 0.035,
              alignment: Alignment.center,
              color: Colors.blue,
              width: screenWidth,
              child: const Text("UPDATE ACCOUNT",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            Expanded(
                child: ListView(
                    padding: const EdgeInsets.fromLTRB(11, 6, 11, 6),
                    shrinkWrap: true,
                    children: [
                  MaterialButton(
                    onPressed: () {},
                    child: const Text("UPDATE USERNAME"),
                  ),
                  const Divider(
                    height: 2,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: const Text("UPDATE PASSWORD"),
                  ),
                  const Divider(
                    height: 2,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: const Text("UPDATE PHONE NUMBER"),
                  ),
                  const Divider(
                    height: 2,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: const Text("UPDATE ADDRESS"),
                  ),
                  const Divider(
                    height: 2,
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (content) => const RegisterPage()));
                    },
                    child: const Text("NEW REGISTER"),
                  ),
                  const Divider(
                    height: 2,
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (content) => const LoginPage()));
                    },
                    child: const Text("LOGIN"),
                  ),
                  const Divider(
                    height: 2,
                  ),
                  MaterialButton(
                    onPressed: () {
                      {}
                    },
                    child: const Text("LOGOUT"),
                  ),
                ])),
          ]),
        ));
  }
}