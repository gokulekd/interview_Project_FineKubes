import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_interview/model/Data%20Base/local_database.dart';
import 'package:project_interview/model/json_model.dart';
import 'package:project_interview/view/splash_screen.dart';
import 'package:responsive_framework/responsive_framework.dart';

// late Box<List<Entry>> localDatabase;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(DatabaseAdapter().typeId)) {
    Hive.registerAdapter(DatabaseAdapter());
  }

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
          ClampingScrollWrapper.builder(context, widget!),
          breakpoints: const [
            ResponsiveBreakpoint.resize(350, name: MOBILE),
            ResponsiveBreakpoint.autoScale(600, name: TABLET),
            ResponsiveBreakpoint.resize(800, name: DESKTOP),
          ]),
      debugShowCheckedModeBanner: false,
      // home: const ScreenSplash(),
      home: const SplashScreen(),
    );
  }
}
