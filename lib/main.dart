import 'package:flutter/material.dart';
import 'package:news_app/ui/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color(0xFF39A552),
          iconTheme: IconThemeData(
              color: Colors.white
          ),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(24),
                  bottomLeft: Radius.circular(24)
              )
          )
      ),
        scaffoldBackgroundColor: Colors.transparent,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF39A552),
            primary: const Color(0xFF39A552)),
            useMaterial3: true,

      ),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName:(_)=>HomeScreen(),
      },
    );
  }
}

