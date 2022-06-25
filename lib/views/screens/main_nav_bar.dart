import 'package:ecommerce_app/provider/products.dart';
import 'package:ecommerce_app/views/screens/navbar_screens/cart_screen.dart';
import 'package:ecommerce_app/views/screens/navbar_screens/feed_screen.dart';
import 'package:ecommerce_app/views/screens/navbar_screens/home_screen.dart';
import 'package:ecommerce_app/views/screens/navbar_screens/profile_screen.dart';
import 'package:ecommerce_app/views/screens/navbar_screens/search_screen.dart';
import 'package:ecommerce_app/views/screens/navbar_screens/upload_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/custom_appbar.dart';

class MainNavBar extends StatefulWidget {
  const MainNavBar({Key? key}) : super(key: key);

  @override
  State<MainNavBar> createState() => _ButtonNavBarState();
}

class _ButtonNavBarState extends State<MainNavBar> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    FeedScreen(),
    SearchScreen(),
    CartScreen(),
    UploadScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _productsProvider =
        Provider.of<ProductsProvider>(context, listen: true);
    return Scaffold(
      body: SafeArea(
        child: _productsProvider.products.isEmpty
            ? FutureBuilder(
                future: _productsProvider.fetchProducts(),
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
                          child: Text('Fetching products'),
                        );
                      case ConnectionState.active:
                      case ConnectionState.done:
                        return Center(
                          child: _widgetOptions.elementAt(_selectedIndex),
                        );
                    }
                  }
                },
              )
            : Center(
                child: _widgetOptions.elementAt(_selectedIndex),
              ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rss_feed),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.upload),
            label: 'Upload',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey[400],
        onTap: _onItemTapped,
      ),
    );
  }
}
