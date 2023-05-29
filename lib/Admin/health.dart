import 'package:flutter/material.dart';
import 'package:techvillage_admin/Admin/Data%20Entries%20Screens/ashaworker.dart';
import 'package:techvillage_admin/Admin/Data%20Entries%20Screens/dentist.dart';
import 'package:techvillage_admin/Admin/Data%20Entries%20Screens/doctor.dart';
import 'package:techvillage_admin/Admin/Data%20Entries%20Screens/homenurse.dart';
import 'package:techvillage_admin/Admin/Data%20Entries%20Screens/nurse.dart';
import 'package:techvillage_admin/Admin/prod_service_tile.dart';

class HealthPage extends StatelessWidget {
  final List healthTitle = [
    'Doctor',
    'Nurse',
    'Home Nurse',
    'Dentist',
    'Asha Worker'
  ];
  final List healthType = const [
    AddDoctor(),
    AddNurse(),
    AddHomeNurse(),
    AddDentist(),
    AddAshaWorker()

  ];
  final List healthImg = [
    'assets/doctor.jpg',
    'assets/nurse.jpg',
    'assets/homenurse.jpg',
    'assets/dentist.jpg',
    'assets/ashaworker.jpg'
  ];

  HealthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(62, 202, 59, 100),
        title: const Text('Health Workers',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            itemCount: healthImg.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 120,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              return ProdServiceTile(
                title: healthTitle[index],
                image: healthImg[index],
                type: healthType[index],
              );
            }),
      ),
    );
  }
}
