import 'package:flutter/material.dart';
import 'package:techvillage_admin/Admin/Data%20Entries%20Screens/constructionworker.dart';
import 'package:techvillage_admin/Admin/Data%20Entries%20Screens/fieldworker.dart';
import 'package:techvillage_admin/Admin/Data%20Entries%20Screens/lawn.dart';
import 'package:techvillage_admin/Admin/Data%20Entries%20Screens/mason.dart';
import 'package:techvillage_admin/Admin/prod_service_tile.dart';

class LocalWorkersPage extends StatelessWidget {
  final List localWorkerType = [
    'Mason',
    'LawnMover',
    'Construction Worker',
    'Field Worker',
  ];

  final List localWorkerImg = [
    'assets/mason.jpg',
    'assets/lawn.png',
    'assets/constructionworker.jpg',
    'assets/fieldworker.png'
  ];

  final List localWorkersType =const [
    AddMason(),
    AddLawnMover(),
    AddConstructionWorker(),
    AddFieldWorker(),

  ];
  LocalWorkersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(62, 202, 59, 100),
        title: const Text('Local Workers',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            itemCount: localWorkerImg.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 120,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              return ProdServiceTile(
                  title: localWorkerType[index],
                  image: localWorkerImg[index],
                  type: localWorkersType[index]);
            }),
      ),
    );
  }
}
