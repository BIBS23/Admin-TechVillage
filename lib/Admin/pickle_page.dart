import 'package:flutter/material.dart';
import 'package:techvillage_admin/Admin/Data%20Entries%20Screens/mango.dart';
import 'package:techvillage_admin/Admin/lime.dart';
import 'package:techvillage_admin/Admin/prod_service_tile.dart';

import 'Data Entries Screens/gooseberry.dart';

class PicklePage extends StatelessWidget {
  final List pickleTitle = ['Lime', 'Mango', 'Gooseberry'];

  final pickleType = const [
    AddLimePickle(),
    AddMangoPickle(),
    AddGooseBerryPickle(),

  ];

  final List pickleImg = [
    'assets/limepickle.jpg',
    'assets/mangopickle.jpg',
    'assets/gooseberry.jpg'
  ];

  PicklePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(62, 202, 59, 100),
        title: const Text('Pickles',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            itemCount: pickleImg.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 120,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              return ProdServiceTile(
                title: pickleTitle[index],
                image: pickleImg[index],
                type: pickleType[index],
              );
            }),
      ),
    );
  }
}
