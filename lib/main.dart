import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:techvillage_admin/controller/access_controller.dart';
import 'package:techvillage_admin/controller/add_to_fav.dart';
import 'package:techvillage_admin/controller/login_controller.dart';
import 'package:techvillage_admin/screens/login_screen.dart';
import 'screens/nav.dart';
import 'screens/splash_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  


  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var auth = FirebaseAuth.instance;
  var isLoggin = false;

  checkState() async {
    auth.authStateChanges().listen((User? user) {
      if (user != null && mounted) {
        setState(() {
          isLoggin = true;
        });
      } else {
        setState(() {
          isLoggin = false;
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
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(create: (_) => AccessStorage()),
        ChangeNotifierProvider(create: (_) => AddToFav()),
      ],
      child: MaterialApp(
        title: 'TechVillage',
        routes: {
          '/signin': (context) => const BottomNav(),
          '/signout': (context) => const LoginScreen(),
        },
        home: isLoggin ? const BottomNav() : const SplashScreen(),
      ),
    );
  }
}
