import 'package:flutter/material.dart';
// import 'package:tmdb/screens/admin_login.dart';
import 'package:tmdb/screens/home_page.dart';
import 'package:tmdb/screens/login.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:tmdb/screens/review_page.dart';

void main() async {
  await GetStorage().initStorage;
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'prodSans', brightness: Brightness.dark),
      routes: {
        '/login': (context) => const LogIn(),
        '/home_page': (context) => const HomePage(),
        // '/admin_login': (context) => const AdminLogin(),
      },
      home: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LogIn();
  }
}
