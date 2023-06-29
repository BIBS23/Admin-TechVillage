import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techvillage_admin/Services/service_page.dart';
import 'package:techvillage_admin/products/products.dart';
import 'package:techvillage_admin/screens/grant_screen.dart';
import 'package:techvillage_admin/screens/user_profile.dart';


class BottomNav extends StatefulWidget {

  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  List screens = const[
    ProductsPage(),
    ServicePage(),
    NotificationPage(),
    TechVillageProfilePage(),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/products.svg',
                width: 23,
                height: 23,
                
              
              ),
              label: 'Products'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/services.svg',
                width: 23,
                height: 23,
                
              ),
              label: 'Services'),
               const BottomNavigationBarItem(
              icon: Icon(Icons.add),label: 'Grants'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined), label: 'Profile'),
        ],
        selectedItemColor:   const Color.fromRGBO(62, 202, 59, 100),
        unselectedItemColor: Colors.black,
      ),
  
    );
  }
}
