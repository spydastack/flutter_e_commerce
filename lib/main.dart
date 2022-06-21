import 'package:ecommerce_app/firebase_options.dart';
import 'package:ecommerce_app/provider/cart.dart';
import 'package:ecommerce_app/provider/products.dart';
import 'package:ecommerce_app/routes.dart';
import 'package:ecommerce_app/views/screens/auth/login_screen.dart';
import 'package:ecommerce_app/views/screens/auth/register_screen.dart';
import 'package:ecommerce_app/views/screens/main_nav_bar.dart';
import 'package:ecommerce_app/views/screens/main_screens/details_screen.dart';
import 'package:ecommerce_app/views/screens/main_screens/feeds_category_screen.dart';
import 'package:ecommerce_app/views/screens/main_screens/reset_password_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      theme: ThemeData(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const Center(
                  child: Text('Waiting for connection'),
                );
              case ConnectionState.active:
                if (snapshot.hasData) {
                  return const MainNavBar();
                } else {
                  return const LoginScreen();
                }
              case ConnectionState.done:
                return Container();
            }
          }
        },
      ),
      routes: {
        login: (context) => const LoginScreen(),
        register: (context) => const RegisterScreen(),
        resetPassword: (context) => const ResetPasswordScreen(),
        mainNavbar: (context) => const MainNavBar(),
        details: (context) => const DetailScreen(),
        categoryFeed: (context) => const CategoryFeedScreen(),
      },
    );
  }
}
