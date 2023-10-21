import 'package:duckstore/CustomerScreen/CustomerOrder.dart';
import 'package:duckstore/CustomerScreen/Wishlist.dart';
import 'package:duckstore/main_screen/Cart_Screen.dart';
import 'package:duckstore/widgets/Alert_dialog.dart';
import 'package:duckstore/widgets/Appbar_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Stack(children: [
        Container(
          height: 230,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.yellow, Colors.brown])),
        ),
        CustomScrollView(
          slivers: [
            SliverAppBar(
              centerTitle: true,
              pinned: true,
              elevation: 0,
              backgroundColor: Colors.white,
              expandedHeight: 140,
              flexibleSpace: LayoutBuilder(
                builder: (context, constraints) {
                  return FlexibleSpaceBar(
                    title: AnimatedOpacity(
                      duration: Duration(milliseconds: 200),
                      opacity: constraints.biggest.height <= 120 ? 1 : 0,
                      child: Text(
                        'Account',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    background: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.yellow, Colors.brown])),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 25, left: 30),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  AssetImage('assets/images/inapp/guest.jpg'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 25),
                              child: Text(
                                'guest'.toUpperCase(),
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                              )),
                          child: TextButton(
                            child: SizedBox(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: Center(
                                  child: Text(
                                    'Cart',
                                    style: TextStyle(
                                        color: Colors.yellow, fontSize: 20),
                                  ),
                                )),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CartScreen(
                                            back: AppBarB(),
                                          )));
                            },
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                          ),
                          child: TextButton(
                            child: SizedBox(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: Center(
                                  child: Text(
                                    'Orders',
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 20),
                                  ),
                                )),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CustomerOrder()));
                            },
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              )),
                          child: TextButton(
                            child: SizedBox(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: Center(
                                  child: Text(
                                    'Wishlist',
                                    style: TextStyle(
                                        color: Colors.yellow, fontSize: 20),
                                  ),
                                )),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => Wishlist())));
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.grey.shade300,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 150,
                          child: Image(
                            image: AssetImage('assets/images/inapp/logo.jpg'),
                          ),
                        ),
                        ProfileHeader(
                          headerlabel: '   Account Info   ',
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Container(
                            height: 260,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              children: [
                                RepeatedInkWell(
                                    title: 'Email Address',
                                    subTitle: 'example@gmail.com',
                                    icon: Icons.email,
                                    onPressed: () {}),
                                YellowDivider(),
                                RepeatedInkWell(
                                  title: 'Phone Number',
                                  icon: Icons.phone,
                                  subTitle: '+917982018903',
                                ),
                                YellowDivider(),
                                RepeatedInkWell(
                                  title: 'Address',
                                  icon: Icons.location_pin,
                                  subTitle: 'F-41 Kamla Nagar',
                                )
                              ],
                            ),
                          ),
                        ),
                        ProfileHeader(headerlabel: '   Account Settings   '),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Container(
                            height: 260,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              children: [
                                RepeatedInkWell(
                                    title: 'Edit Profile', icon: Icons.edit),
                                YellowDivider(),
                                RepeatedInkWell(
                                  title: 'Change Password',
                                  icon: Icons.lock,
                                  onPressed: () {},
                                ),
                                YellowDivider(),
                                RepeatedInkWell(
      title: 'Log Out',
      icon: Icons.logout,
      onPressed: () {
        MyAlertDilaog.showMyDialog(
          context: context,
          title: 'Log Out',
          content: 'Are you sure you want to log out?',
          tabYes: () async {
            try {
              await FirebaseAuth.instance.signOut();
              Navigator.pop(context); // Close the dialog
              Navigator.pushReplacementNamed(context, 'WelcomeScreen');
            } catch (e) {
              // Handle any errors that might occur during sign-out.
              print('Error logging out: $e');
            }
          }, tabNo: () {},
        );
      },
    )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ]),
    );
  }
}

class YellowDivider extends StatelessWidget {
  const YellowDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Divider(
        color: Colors.yellow,
        thickness: 1,
      ),
    );
  }
}

class RepeatedInkWell extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icon;
  final Function()? onPressed;
  const RepeatedInkWell({
    super.key,
    required this.title,
    this.subTitle = ' ',
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: ListTile(
        title: Text(title),
        subtitle: Text(subTitle),
        leading: Icon(icon),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  final String headerlabel;
  const ProfileHeader({
    super.key,
    required this.headerlabel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
            width: 50,
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
          Text(
            headerlabel,
            style: TextStyle(color: Colors.grey, fontSize: 24),
          ),
          SizedBox(
            height: 40,
            width: 50,
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
