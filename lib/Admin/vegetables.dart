import 'package:flutter/material.dart';
import 'package:techvillage_admin/Admin/Data%20Entries%20Screens/bittergourd.dart';
import 'package:techvillage_admin/Admin/Data%20Entries%20Screens/ivygourd.dart';
import 'package:techvillage_admin/Admin/Data%20Entries%20Screens/ladiesfinger.dart';
import 'package:techvillage_admin/Admin/Data%20Entries%20Screens/tomato.dart';
import 'package:techvillage_admin/Admin/prod_service_tile.dart';

class VegetablesPage extends StatelessWidget {
  final List vegTitle = ['Ladies Finger', 'Tomato', 'BitterGourd', 'IvyGourd'];

  final List vegType = [
    AddLadiesFinger(),
    AddTomato(),
    AddBitterGourd(),
    AddIvyGourd()
  ];

  final List vegImg = [
    'assets/ladiesfinger.jpg',
    'assets/Tomato.jpg',
    'assets/BitterGourd.jpg',
    'assets/IvyGourd.jpg'
  ];

  VegetablesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(62, 202, 59, 100),
        title: const Text('Vegetables',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            itemCount: vegImg.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 120,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              return ProdServiceTile(
                title: vegTitle[index],
                image: vegImg[index],
                type: vegType[index],
              );
            }),
      ),
    );
  }
}
