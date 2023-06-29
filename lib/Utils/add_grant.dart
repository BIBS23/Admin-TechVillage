import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techvillage_admin/Utils/mytextfield.dart';
import 'package:techvillage_admin/controller/access_controller.dart';

class AddGrantDetails {
  void showModalSheet(
      BuildContext context,
      TextEditingController grantcontroller,
      TextEditingController expcontroller,
      TextEditingController categorycontroller) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        builder: (BuildContext context) {
          return Consumer<AccessStorage>(builder: (context, access, child) {
            return Container(
              padding: const EdgeInsets.all(16),
              child: ListView(
                children: [
                  Center(
                    child: Container(
                      width: 80,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  const Center(
                      child: Text('Add Grants',
                          style: TextStyle(fontSize: 15, letterSpacing: 2))),
                  const SizedBox(height: 26),
                  TxtField(
                      mycontroller: grantcontroller,
                      type: TextInputType.text,
                      mylabel: 'Grant',
                      maxlines: 1),
                  TxtField(
                      mycontroller: expcontroller,
                      type: TextInputType.text,
                      mylabel: 'Expiry Date',
                      maxlines: 5),
                  TxtField(
                      mycontroller: categorycontroller,
                      type: TextInputType.text,
                      maxlines: 1,
                      mylabel: 'Category'),
                  const SizedBox(height: 35),
                  Center(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                        backgroundColor: const Color.fromRGBO(69, 160, 54, 100),
                        minimumSize: const Size(200, 55),
                        disabledBackgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      icon: const Icon(Icons.add),
                      label: const Text(
                        'Add Grant',
                        style: TextStyle(fontSize: 15, letterSpacing: 2),
                      ),
                      onPressed: () {
                        DateTime now = DateTime.now();
                        CollectionReference collectionRef =
                            FirebaseFirestore.instance.collection('grants');
                        collectionRef.add({
                          'grant': grantcontroller.text,
                          'exp': expcontroller.text,
                          'category': categorycontroller.text,
                          'timestamp': now.toString(),
                        }).then((value) {
                          grantcontroller.clear();
                          expcontroller.clear();
                          categorycontroller.clear();
                          Navigator.pop(context);
                        });
                      },
                    ),
                  )
                ],
              ),
            );
          });
        });
  }
}
