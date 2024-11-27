import 'package:verbat_iot/set_one.dart';
import 'package:verbat_iot/view/dash_board_screen.dart';

class RegistrationScreen extends ConsumerWidget {
  // ConsumerWidget allows you to read providers
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController nationalIdController = TextEditingController();
    final TextEditingController farmIdController = TextEditingController();
    final TextEditingController fatherNameController = TextEditingController();
    final TextEditingController coopIdController = TextEditingController();
    final TextEditingController coopNameController = TextEditingController();
    final TextEditingController dobController = TextEditingController();
    final TextEditingController genderController = TextEditingController();

    final sharedPreferencesService = ref.read(sharedPreferencesProvider);

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
        // Wrap the body with SingleChildScrollView
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Farmer Registration text
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Farmer Registration',
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
                    Svgpath.farmergroup,
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
            // Custom Text Input widget for user input
            SizedBox(
              height: 20,
            ),
            CustomTextInput(
              labelText: 'National ID',
              hintText: 'ID',
              controller: nationalIdController,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextInput(
              labelText: 'Farm ID',
              hintText: 'ID',
              controller: farmIdController,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextInput(
              labelText: 'Father\'s Name',
              hintText: 'Name',
              controller: fatherNameController,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextInput(
              labelText: 'Coop Name',
              hintText: 'ID',
              controller: coopNameController,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextInput(
              labelText: 'Coop ID',
              hintText: 'Coop',
              controller: coopIdController,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextInput(
              labelText: 'DOB',
              hintText: 'M/D/Y',
              controller: dobController,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextInput(
              labelText: 'Gender',
              hintText: 'Male',
              controller: genderController,
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Center the widget
              children: [
                UploadFarmerPhotoWidget(),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Center the widget
              children: [
                SaveButton(
                  onPressed: () async {
                    if (nationalIdController.text.isNotEmpty &&
                        farmIdController.text.isNotEmpty &&
                        fatherNameController.text.isNotEmpty &&
                        coopIdController.text.isNotEmpty &&
                        coopNameController.text.isNotEmpty &&
                        dobController.text.isNotEmpty &&
                        genderController.text.isNotEmpty) {
                      // Save data to SharedPreferences
                      await sharedPreferencesService.saveData(
                        nationalId: nationalIdController.text,
                        farmId: farmIdController.text,
                        fatherName: fatherNameController.text,
                        coopId: coopIdController.text,
                        coopName: coopNameController.text,
                        dob: dobController.text,
                        gender: genderController.text,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Registration Successful'),
                          backgroundColor:
                              Colors.green, // You can change the color
                        ),
                      );
                      // Navigate to the Dashboard screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const DashBoardScreen()),
                      );
                    }
                  },
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
