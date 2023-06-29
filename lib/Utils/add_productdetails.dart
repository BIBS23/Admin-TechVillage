import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:techvillage_admin/Utils/mytextfield.dart';
import 'package:techvillage_admin/controller/access_controller.dart';

class AddProdDetails {
  void showModalSheet(
      BuildContext context,
      TextEditingController namecontroller,
      TextEditingController aboutcontroller,
      TextEditingController ratecontroller,
      TextEditingController phonecontroller,
      String docname) {
        
    showModalBottomSheet(
          isScrollControlled: true,
      
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
     
       
            return  Consumer<AccessStorage>(builder: (context, access, child) {
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
                        child: Text('Add Products',
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
                        mylabel: 'Seller Name',
                        maxlines: 1),
                    TxtField(
                        mycontroller: aboutcontroller,
                        type: TextInputType.multiline,
                        mylabel: 'About ',
                        maxlines: 5),
                    TxtField(
                        mycontroller: ratecontroller,
                        type: TextInputType.text,
                        mylabel: 'Rate',
                        maxlines: 1),
                    TxtField(
                        mycontroller: phonecontroller,
                        type: TextInputType.text,
                        mylabel: 'Phone',
                        maxlines: 1),
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
                          'Add Product',
                          style: TextStyle(fontSize: 15, letterSpacing: 2),
                        ),
                        onPressed: () {
                          CollectionReference collectionRef =
                              FirebaseFirestore.instance.collection('products');
                          print('this is my doc name $docname');
                          collectionRef.doc(docname).collection('sellers').add({
                            'about': aboutcontroller.text,
                            'profimg': access.imageUrl,
                            'sellername': namecontroller.text,
                            'phone': phonecontroller.text,
                            'rate': ratecontroller.text,
                          }).then((value) {
                            namecontroller.clear();
                            ratecontroller.clear();
                            aboutcontroller.clear();
                            phonecontroller.clear();
                            Navigator.pop(context);
                          });
                        },
                      ),
                    )
                  ],
                ),
              );
            });
          }
        );
      
    
  }
}
