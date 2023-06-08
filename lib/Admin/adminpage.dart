import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techvillage_admin/Admin/product_screen.dart';
import 'package:techvillage_admin/Admin/provider/login_controller.dart';
import 'package:techvillage_admin/Admin/service_page.dart';
import 'Data Entries Screens/grant.dart';
import 'utils/tile.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthController>(
      builder: (context, logout, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(62, 202, 59, 100),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                logout.handleGoogleSignOut(context);
              },
              icon:  Icon(Icons.logout),
            )
          ],
          title: const Text('Admin App', style: TextStyle(letterSpacing: 5)),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                const Color.fromARGB(117, 141, 230, 128).withOpacity(1),
              ],
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: [
                    MyTile(
                      image: 'assets/services.png',
                      title: 'Services',
                      route: ServicePage(),
                    ),
                    const MyTile(
                      image: 'assets/products.png',
                      title: 'Products',
                      route: ProductsPage(),
                    ),
                    const MyTile(
                      image: 'assets/grant1.png',
                      title: 'Grants',
                      route: AddGrants(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
