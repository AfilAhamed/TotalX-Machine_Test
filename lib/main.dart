import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/auth_controller.dart';
import 'firebase_options.dart';
import 'view/auth/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthController(),
        ),
      ],
      child: MaterialApp(
        title: 'Todo List',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: const LoginScreen(),
      ),
    );
  }
}
