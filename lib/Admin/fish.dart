import 'package:flutter/material.dart';
import 'package:techvillage_admin/Admin/Data%20Entries%20Screens/catla.dart';
import 'package:techvillage_admin/Admin/Data%20Entries%20Screens/mushi.dart';
import 'package:techvillage_admin/Admin/Data%20Entries%20Screens/rohu.dart';
import 'package:techvillage_admin/Admin/Data%20Entries%20Screens/thilopia.dart';
import 'package:techvillage_admin/Admin/prod_service_tile.dart';

class FishPage extends StatelessWidget {
  final List fishTitle = ['Mushi', 'Thilopia', 'Catla', 'Rohu'];

  final List fishType = const [
    AddMushi(),
    AddThilopia(),
    AddCatla(),
    AddRohu(),
  ];

  final List fishImg = [
    'assets/mushi.jpg',
    'assets/thilopia.jpg',
    'assets/catla.jpg',
    'assets/rohu.jpg'
  ];

  FishPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(62, 202, 59, 100),
        title: const Text('Spices',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            itemCount: fishImg.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 120,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              return ProdServiceTile(
                title: fishTitle[index],
                image: fishImg[index],
                type: fishType[index],
              );
            }),
      ),
    );
  }
}
