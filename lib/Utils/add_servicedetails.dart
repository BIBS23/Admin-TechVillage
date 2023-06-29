import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:techvillage_admin/Utils/mytextfield.dart';
import 'package:techvillage_admin/controller/access_controller.dart';

class AddServiceDetails {
  void showModalSheet(
      BuildContext context,
      TextEditingController namecontroller,
      TextEditingController aboutcontroller,
      TextEditingController expcontroller,
      TextEditingController phonecontroller,
      TextEditingController availcontroller,
      String docname) {
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
                    child: Text('Add Service Details',
                        style: TextStyle(fontSize: 15, letterSpacing: 2))),
                const SizedBox(height: 22),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      access.getAccess(context);
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: SizedBox(
                                height: 150,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          access.pickImage(ImageSource.camera);
                                          Navigator.pop(context);
                                        },
                                        child: const ListTile(
                                          leading: Icon(Icons.camera),
                                          title: Text('Camera'),
                                        )),
                                    GestureDetector(
                                        onTap: () {
                                          access.pickImage(ImageSource.gallery);
                                          Navigator.pop(context);
                                        },
                                        child: const ListTile(
                                          leading: Icon(Icons.photo),
                                          title: Text('Gallary'),
                                        )),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0.1,
                              blurRadius: 7,
                            )
                          ]),
                      child: const Icon(Icons.camera_alt_outlined),
                    ),
                  ),
                ),
                const SizedBox(height: 26),
                TxtField(
                    mycontroller: namecontroller,
                    type: TextInputType.text,
                    mylabel: 'Worker Name',
                    maxlines: 1),
                TxtField(
                    mycontroller: aboutcontroller,
                    type: TextInputType.multiline,
                    mylabel: 'About ',
                    maxlines: 5),
                TxtField(
                    mycontroller: expcontroller,
                    type: TextInputType.text,
                    mylabel: 'Experiance',
                    maxlines: 1),
                TxtField(
                    mycontroller: phonecontroller,
                    type: TextInputType.number,
                    mylabel: 'Phone',
                    maxlines: 1),
                TxtField(
                    mycontroller: availcontroller,
                    type: TextInputType.text,
                    mylabel: 'Availability',
                    maxlines: 1),
                const SizedBox(height: 35),
                Align(
                  alignment: Alignment.bottomCenter,
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
                      'Add Service',
                      style: TextStyle(fontSize: 15, letterSpacing: 2),
                    ),
                    onPressed: () {
                      CollectionReference collectionRef =
                          FirebaseFirestore.instance.collection('services');
                      collectionRef.doc(docname.toLowerCase()).collection('workers').add({
                        'about': aboutcontroller.text,
                        'profimg': access.imageUrl,
                        'workername': namecontroller.text,
                        'phone': phonecontroller.text,
                        'exp': expcontroller.text,
                        'availability': availcontroller.text,
                      }).then((value) {
                        aboutcontroller.clear();
                        namecontroller.clear();
                        phonecontroller.clear();
                        expcontroller.clear();
                        availcontroller.clear();
                        access.imageUrl.toString() == '';
                        Navigator.pop(context);
                      });
            
                     
                    },
                  ),
                )
              ],
            ),
          );
        });
      },
    );
  }
}
