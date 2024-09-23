import 'package:flutter/material.dart';
// import 'package:dialy/home_screen.dart';
import 'package:dialy/login.dart';
import 'package:dialy/signup.dart';

// void main() {
//   runApp(
//     MaterialApp(
//       home: Scaffold(
//         body: Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Color.fromRGBO(93, 224, 230, 1),
//                   Color.fromRGBO(0, 74, 173, 1)
//                 ],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//             ),
//             child: Center(child: const HomeScreen())),
//       ),
//     ),
//   );
// }

String? USERID;

void main() {
  runApp(const MaterialApp(home: MainApp()));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(93, 224, 230, 1),
            Color.fromRGBO(0, 74, 173, 1)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(child: SignUpPage()),
      ),
    );
  }
}
