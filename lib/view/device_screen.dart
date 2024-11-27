import 'package:verbat_iot/set_one.dart';
import 'package:verbat_iot/viewmodel/dashboard/device_widget.dart';

class DeviceScreen extends StatelessWidget {
  const DeviceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: Builder(
          builder: (context) => ClipPath(
            clipper: CustomAppBarClipper(),
            child: Container(
              color: Colors.green,
              child: Stack(
                children: [
                  // Left-side menu icon
                  Positioned(
                    left: 16,
                    top: 80,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        print("Menu icon tapped");
                      },
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green.withOpacity(0.2),
                        ),
                        child: const Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                  // Center leaf SVG
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Transform.translate(
                        offset: const Offset(0, 7),
                        child: SvgPicture.asset(
                          Svgpath.leaf,
                          height: 90,
                          width: 90,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  // Right-side icons (map and ellipse)
                  Positioned(
                    right: 16,
                    top: 80,
                    child: Row(
                      children: [
                        GestureDetector(
                          child: Tooltip(
                            message: "Online",
                            child: SvgPicture.asset(
                              Svgpath.ellipse,
                              height: 40,
                              width: 40,
                            ),
                          ),
                        ),
                        const SizedBox(width: 22),
                        GestureDetector(
                          child: Tooltip(
                            message: "Kericho",
                            child: SvgPicture.asset(
                              Svgpath.map,
                              height: 40,
                              width: 40,
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Connect Device',
                  style: TextStyle(
                    fontFamily: 'Schyler',
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 20), // Space between text and SVG
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SvgPicture.asset(
                    Svgpath.device,
                    height: 75, // Adjust size as needed
                    width: 75, // Adjust size as needed
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2), // Minimal space between text and line
            // Green line
            Container(
              height: 4, // Adjust height for the line
              width: 95, // Adjust width based on text length
              color: Colors.green, // Green color for the line
            ),

            SizedBox(
              height: 20,
            ),

            DeviceCard(
              deviceName: 'Device 1',
              onConnectPressed: () {
                print('Device 1 Connect Pressed');
              },
            ),
            SizedBox(
              height: 20,
            ),

            DeviceCard(
              deviceName: 'Device 2',
              onConnectPressed: () {
                print('Device  Connect Pressed');
              },
            ),
            SizedBox(
              height: 20,
            ),

            DeviceCard(
              deviceName: 'Device 3',
              onConnectPressed: () {
                print('Device  Connect Pressed');
              },
            ),
            SizedBox(
              height: 20,
            ),

            DeviceCard(
              deviceName: 'Device 4',
              onConnectPressed: () {
                print('Device  Connect Pressed');
              },
            ),
          ],
        ),
      ),
    );
  }
}
