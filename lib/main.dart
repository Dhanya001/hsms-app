import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hsms/screens/Home_screen/splash_screen.dart';
import 'package:hsms/screens/Home_screen/home_page.dart';
import 'package:hsms/screens/Home_screen/onbording_screen.dart';
import 'package:hsms/views/notes.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
        options: const FirebaseOptions(apiKey: "AIzaSyDKSGcZkerbWTV9YkR-3TI7hvMNnZ69jFE", appId: "1:668538176830:web:56919ddbe3aa016350586f", messagingSenderId: "668538176830", projectId: "hsms-80f08")
    );

  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Housing Society Management',
      theme: ThemeData(brightness: Brightness.light,primaryColor: Colors.blue[100]),
      //  0xffFFF8DC
      darkTheme: ThemeData(brightness: Brightness.dark,primaryColor: Color(0xff121212)),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
       //home: const Notes(),
    );
  }
}


