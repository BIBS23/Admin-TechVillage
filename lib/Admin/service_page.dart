import 'package:flutter/material.dart';
import 'package:techvillage_admin/Admin/Data%20Entries%20Screens/auto.dart';
import 'package:techvillage_admin/Admin/Data%20Entries%20Screens/carpenter.dart';
import 'package:techvillage_admin/Admin/Data%20Entries%20Screens/climbers.dart';
import 'package:techvillage_admin/Admin/Data%20Entries%20Screens/drycleaners.dart';
import 'package:techvillage_admin/Admin/Data%20Entries%20Screens/electrician.dart';
import 'package:techvillage_admin/Admin/Data%20Entries%20Screens/housekeepers.dart';
import 'package:techvillage_admin/Admin/Data%20Entries%20Screens/mechanic.dart';
import 'package:techvillage_admin/Admin/Data%20Entries%20Screens/painter.dart';
import 'package:techvillage_admin/Admin/Data%20Entries%20Screens/plumber.dart';
import 'package:techvillage_admin/Admin/Data%20Entries%20Screens/tailor.dart';
import 'package:techvillage_admin/Admin/Data%20Entries%20Screens/tutor.dart';
import 'package:techvillage_admin/Admin/health.dart';
import 'package:techvillage_admin/Admin/localworkers.dart';
import 'package:techvillage_admin/Admin/prod_service_tile.dart';
import 'package:techvillage_admin/Admin/service_list.dart';

class ServicePage extends StatelessWidget {

  final List serviceType = [
    const AddPlumber(),
    const AddElectrician(),
    const AddAutoDriver(),
    HealthPage(),
    const AddTailor(),
    LocalWorkersPage(),
    const AddTutor(),
    const AddMechanic(),
    const AddHouseKeepers(),
    const AddCarpenter(),
    const AddCoconutClimbers(),
    const AddPainter(),
    const AddDryCleaners(),
  ];
 

   ServicePage({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color.fromRGBO(62, 202, 59, 100),
        title: const Text('Services',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        elevation: 0,
          
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
          itemCount: serviceList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 120,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          crossAxisCount: 2),
          itemBuilder: (context, index) {
            return ProdServiceTile(image: serviceList[index],title: serviceTitle[index],type: 
            serviceType[index]);
          }),
        )
    );
  }
}
