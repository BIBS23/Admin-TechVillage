import 'package:flutter/material.dart';
import 'package:techvillage_admin/Admin/Data%20Entries%20Screens/chilli.dart';
import 'package:techvillage_admin/Admin/Data%20Entries%20Screens/ginger.dart';
import 'package:techvillage_admin/Admin/Data%20Entries%20Screens/pepper.dart';
import 'package:techvillage_admin/Admin/Data%20Entries%20Screens/turmeric.dart';
import 'package:techvillage_admin/Admin/prod_service_tile.dart';

class SpicesPage extends StatelessWidget {
  final List spiceTitle = ['Pepper', 'Ginger', 'Turmeric', 'Red Chilli'];

  final List spiceType = const [
    AddPepper(),
    AddGinger(),
    AddTurmeric(),
    AddChilliPowder()
  ];

  final List spiceImg = [
    'assets/pepper.jpg',
    'assets/ginger.jpg',
    'assets/turmeric.jpg',
    'assets/chilli.png'
  ];

  SpicesPage({super.key});

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
            itemCount: spiceImg.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 120,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              return ProdServiceTile(
                title: spiceTitle[index],
                image: spiceImg[index],
                type: spiceType[index],
              );
            }),
      ),
    );
  }
}
