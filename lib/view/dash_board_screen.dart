import 'package:verbat_iot/example.dart';
import 'package:verbat_iot/set_one.dart';
import 'package:verbat_iot/view/app_drawer.dart';
import 'package:verbat_iot/view/device_screen.dart';
import 'package:verbat_iot/view/registration_screen.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(), // Add the Drawer here
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120), // Adjust height as needed
        child: Builder(
          builder: (context) => ClipPath(
            clipper: CustomAppBarClipper(),
            child: Container(
              color: Colors.green, // Background color for the app bar
              child: Stack(
                children: [
                  // Left-side menu icon
                  Positioned(
                    left:
                        16, // Positioning the menu icon to the left of the app bar
                    top: 80, // Adjust top to center it vertically
                    child: GestureDetector(
                      onTap: () {
                        Scaffold.of(context)
                            .openDrawer(); // This will open the drawer
                      },
                      child: Container(
                        height: 60, // Adjust size as needed
                        width: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle, // Optional: make it a circle
                          color: Colors.green.withOpacity(0.2), // Optional
                        ),
                        child: const Icon(
                          Icons.menu,
                          color: Colors.white, // Icon color
                          size: 40, // Set icon size here (optional)
                        ),
                      ),
                    ),
                  ),
                  // Centering the leaf SVG in the app bar
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0), // Adjust for positioning
                      child: Transform.translate(
                        offset: const Offset(0, 7),
                        child: SvgPicture.asset(
                          Svgpath.leaf, // Reference to the SVG file
                          height: 90, // Adjust size as needed
                          width: 90, // Adjust size as needed
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  // Right-side icons (map and ellipse)
                  Positioned(
                    right:
                        16, // Positioning the icons to the right of the app bar
                    top: 80, // Aligning the icons vertically
                    child: Row(
                      children: [
                        // Tooltip for the ellipse icon
                        GestureDetector(
                          child: Tooltip(
                            message: "Online",
                            child: SvgPicture.asset(
                              Svgpath.ellipse,
                              height: 40, // Adjust size as needed
                              width: 40, // Adjust size as needed
                            ),
                          ),
                        ),
                        const SizedBox(width: 22), // Space between icons
                        // Tooltip for the map icon
                        GestureDetector(
                          child: Tooltip(
                            message: "Kericho",
                            child: SvgPicture.asset(
                              Svgpath.map,
                              height: 40, // Adjust size as needed
                              width: 40, // Adjust size as needed
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    height: 4, // Adjust height to make the line bold
                    width: 100, // Adjust width based on text length
                    color: Colors.green, // Green color for the line
                  ),
                ),
                // Quick Links Row
                Row(
                  children: [
                    const Text(
                      'Quick Links',
                      style: TextStyle(
                        fontFamily: 'Schyler',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20, width: 20),
                    SvgPicture.asset(
                      Svgpath.frontIcon, // Reference the frontIcon from Svgpath
                      height: 50, // Adjust size as needed
                      width: 50, // Adjust size as needed
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Add the Farmer Registration Card below the green line
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const RegistrationScreen()));
                print('Farmer Registration Card Tapped');
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10), // Rounded corners for the card
                ),
                elevation: 5, // Card elevation
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    children: [
                      // Farmer image in the card
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            Svgpath.farmer, // Farmer image path
                            height: 70, // Adjust size as needed
                            width: 70, // Adjust size as needed
                          ),
                          const SizedBox(
                              height: 10), // Space between image and line
                          Container(
                            height: 4, // Green line height
                            width: 60, // Adjust width as needed
                            color: Colors.green, // Green color for the line
                          ),
                        ],
                      ),
                      const SizedBox(width: 30),
                      // Farmer Registration text
                      const Text(
                        'Farmer Registration',
                        style: TextStyle(
                          fontFamily: 'Schyler',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),

          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const DeviceScreen()));
                print('connect device Card Tapped');
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10), // Rounded corners for the card
                ),
                elevation: 5, // Card elevation
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    children: [
                      // Farmer image in the card
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            Svgpath.device, // Farmer image path
                            height: 70, // Adjust size as needed
                            width: 70, // Adjust size as needed
                          ),
                          const SizedBox(
                              height: 10), // Space between image and line
                          Container(
                            height: 4, // Green line height
                            width: 60, // Adjust width as needed
                            color: Colors.green, // Green color for the line
                          ),
                        ],
                      ),
                      const SizedBox(width: 30),
                      // Farmer Registration text
                      const Text(
                        'Connect Device',
                        style: TextStyle(
                          fontFamily: 'Schyler',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
