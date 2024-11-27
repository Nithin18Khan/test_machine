import 'package:verbat_iot/example.dart';
import 'package:verbat_iot/set_one.dart';
import 'package:verbat_iot/view/dash_board_screen.dart';
import 'package:verbat_iot/view/login_screen.dart';
import 'package:verbat_iot/view/registration_screen.dart'; // Assuming this is for your custom SVG paths

// Drawer Item Model
class DrawerItem {
  final Widget icon;
  final String title;
  final Widget route;

  DrawerItem({required this.icon, required this.title, required this.route});
}

// Define Drawer Items
final drawerItems = [
  DrawerItem(
    icon: SvgPicture.asset(
      Svgpath.quickLinks,
      height: 50,
      width: 50,
    ),
    title: 'Quick Links',
    route: const SavedDataScreen(),
  ),
  DrawerItem(
    icon: SvgPicture.asset(
      Svgpath.group,
      height: 50,
      width: 50,
    ),
    title: 'Farmer Registration',
    route: const RegistrationScreen(),
  ),
  DrawerItem(
    icon: SvgPicture.asset(
      Svgpath.signOut,
      height: 50,
      width: 50,
    ),
    title: 'Sign Out',
    route: const LoginScreen(),
  ),
];

// The App Drawer
class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors
                  .green, // Set the background color of the header to green
            ),
            accountName: Text(
              'John Smith',
              style: TextStyle(
                color: Colors.white, // Set the account name text color to white
              ),
            ),
            accountEmail: Text(
              'johnsmith@gmail.com',
              style: TextStyle(
                color:
                    Colors.white, // Set the account email text color to white
              ),
            ),
            currentAccountPicture: CircleAvatar(
              radius: 40, // Make the avatar larger or smaller
              backgroundColor: const Color.fromARGB(
                  255, 230, 193, 193), // Background color for the avatar
              // Image path for profile
              child: SvgPicture.asset(
                Svgpath
                    .profile, // If you want to overlay an SVG on top of the background image
                height: 40,
                width: 40,
                fit: BoxFit.contain,
              ),
            ),
          ),
          ...drawerItems
              .map((item) => ListTile(
                    leading: item.icon,
                    title: Text(
                      item.title,
                      style: TextStyle(
                        color: Colors.black, // Set title text color to green
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context); // Close the drawer
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => item.route),
                      );
                    },
                  ))
              .toList(),
        ],
      ),
    );
  }
}
