import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'util/routes.dart';
import 'util/strings.dart';
import 'package:flutter/services.dart';

int? isViewed;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt('onBoard');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(
          fontFamily: 'Raleway',
          backgroundColor: Colors.white,
          scaffoldBackgroundColor: Colors.white
      ),
      initialRoute: '/splashscreen',
      routes: customRoutes,
    );
  }
}