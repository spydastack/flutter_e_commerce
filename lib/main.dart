import 'package:ecommerce_app/firebase_options.dart';
import 'package:ecommerce_app/provider/cart.dart';
import 'package:ecommerce_app/provider/products.dart';
import 'package:ecommerce_app/routes.dart';
import 'package:ecommerce_app/views/screens/auth/login_screen.dart';
import 'package:ecommerce_app/views/screens/auth/register_screen.dart';
import 'package:ecommerce_app/views/screens/main_nav_bar.dart';
import 'package:ecommerce_app/views/screens/main_screens/details_screen.dart';
import 'package:ecommerce_app/views/screens/main_screens/reset_password_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-commerce App',
      // theme: ThemeData.dark().copyWith(
      //   primaryColor: Colors.black,
      //   scaffoldBackgroundColor: Colors.white,
      // ),
      initialRoute: mainNavbar,
      routes: {
        login: (context) => const LoginScreen(),
        register: (context) => const RegisterScreen(),
        resetPassword: (context) => const ResetPasswordScreen(),
        mainNavbar: (context) => const MainNavBar(),
        details: (context) => const DetailScreen(),
      },
    );
  }
}
