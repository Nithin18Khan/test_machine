
 

import 'package:verbat_iot/set_one.dart';

void main() {
  runApp(
     ProviderScope(child: VerbatIot()),
  );
}

class VerbatIot extends StatelessWidget {
   VerbatIot({super.key});

  final MainColors mainColors = MainColors();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: mainColors.toThemeData(),
      scrollBehavior: AppScrollBehavior(),
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      onGenerateRoute:RouteGen.generateRoute ,
    );
  }


    String get initialRoute => Routes.loginScreen;

}
