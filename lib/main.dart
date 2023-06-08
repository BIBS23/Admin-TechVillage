import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:techvillage_admin/Admin/adminpage.dart';
import 'package:techvillage_admin/Admin/provider/dbcontroller.dart';
import 'Admin/login_screen.dart';
import 'Admin/provider/login_controller.dart';
import 'Admin/provider/media_access.dart';
import 'Admin/splash_screen.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var auth = FirebaseAuth.instance;
  var isLoggin = false;
  bool isDeviceConnected = false;
  bool isAlertSet = false;
  
  checkState() async {
    auth.authStateChanges().listen((User? user) async {
      if (user != null && mounted) {
        setState(() {
          isLoggin = true;
        });
      }
    });
  }

  @override
  void initState() {
    checkState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AccessStorage()),
        ChangeNotifierProvider(create: (_) => ServiceController()),
        ChangeNotifierProvider(create: (_) => AuthController()),
      ],
      child: MaterialApp(
        title: 'TechVillage Admin',
        routes: {
          '/signin': (context) => const AdminHomePage(),
          '/signout': (context) => const LoginScreen(),
        },
        home: isLoggin ? const AdminHomePage() : const SplashScreen(),
      ),
    );
  }
}
