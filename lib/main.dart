import 'package:flutter/material.dart';
import 'package:message_board_app/firebase_options.dart';
import 'package:message_board_app/pages/ItemPage.dart';
import 'package:message_board_app/pages/login_page.dart';
import 'package:message_board_app/services/auth/auth_gate.dart';
import 'package:message_board_app/services/auth/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'pages/home_page.dart';
import 'services/auth/login_or_register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthService(),
      child: const MyApp(),
    ),
  );
}


int currentIndex = 0;

void navigateToScreens(int index) {
  currentIndex = index;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: ItemPage(),
//       theme: ThemeData(
//         scaffoldBackgroundColor: Colors.blue[100],
//       ),
//     );
//   }
// }


// class MyApp extends StatelessWidget {
//   const MyApp({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         backgroundColor: Colors.blue[100], // Set the background color here
//         body: AuthGate(), // Set AuthGate as the body
//       ),
//       theme: ThemeData(
//         scaffoldBackgroundColor: Colors.blue[100], // You can set it here too
//       ),
//     );
//   }
// }

 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blue[100],
      ),
      routes: {
        "logIn": (context) => LoginOrRegister(),
        "/": (context) => HomePage(),
        "homePage": (context) => HomePage(),
        "itemPage": (context) => ItemPage(),
      },
    );
  }
}