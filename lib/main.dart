import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsFlutterBinding widgetsBinding = WidgetsFlutterBinding();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const SplashScreenApp());
}

class SplashScreenApp extends StatelessWidget {
  const SplashScreenApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Splash Screen Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Making the pausing
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    print('pausing');
    await Future.delayed(const Duration(seconds: 3));
    print('unpausing');
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Main Screen',
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
