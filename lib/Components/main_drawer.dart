import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20.0);
  // final TokenModel authToken;

  const MainDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Drawer(
          child: Container(
            color: Colors.white,
            child: InkWell(
              child: ListView(
                shrinkWrap: true,
                padding: padding,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context, false),
                          icon: const Icon(
                            Icons.close,
                            size: 30,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  buildMenuItem(
                    text: 'Dashboard',
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const Divider(
                    color: Colors.blueGrey,
                    indent: 15,
                    endIndent: 15,
                  ),
                  buildMenuItem(
                    text: 'Edit Profile',
                    onClicked: () => selectedItem(context, 6),
                  ),
                  const Divider(
                    color: Colors.blueGrey,
                    indent: 15,
                    endIndent: 15,
                  ),
                  buildMenuItem(
                    text: 'Logout',
                    onClicked: () => selectedItem(context, 7),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    // required IconData icon,
    VoidCallback? onClicked,
  }) {
    return ListTile(
      // leading: Icon(
      //   icon,
      //   color: color,
      // ),
      title: Text(
        text,
        style: const TextStyle(
          fontFamily: 'Roboto',
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Color(0xFF5a6d7d),
        ),
      ),
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => DashboardScreen(authToken: authToken),
        //   ),
        // );
        break;
      case 1:
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => MyShipments(
        //       authToken: authToken,
        //       // shipmentId: shipmentId
        //     ),
        //   ),
        // );
        break;
      case 2:
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => Pickups(
        //       authToken: authToken,
        //     ),
        //   ),
        // );
        break;
      case 3:
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => PaymentHistoryScreen(
        //       authToken: authToken,
        //     ),
        //   ),
        // );
        break;
      case 4:
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => PackageHistoryScreen(
        //       authToken: authToken,
        //     ),
        //   ),
        // );
        break;

      case 5:
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => MyaddressScreen(authToken: authToken),
        //   ),
        // );
        break;

      case 6:
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => EditProfile(
        //       authToken: authToken,
        //       controller: TextEditingController(),
        //     ),
        //   ),
        // );
        break;

      case 7:
        // Navigator.of(context).pushReplacement(
        //   MaterialPageRoute(
        //     builder: (context) => LoginScreen(
        //       controller: TextEditingController(),
        //     ),
        //   ),
        // );
        break;
    }
  }
}
