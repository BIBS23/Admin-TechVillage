import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:techvillage_admin/Admin/provider/dbcontroller.dart';
import 'package:techvillage_admin/Admin/provider/login_controller.dart';
import 'package:techvillage_admin/Admin/provider/media_access.dart';
import 'package:techvillage_admin/Admin/utils/txtfield.dart';


class AddLimePickle extends StatefulWidget {
  const AddLimePickle({
    super.key,
  });

  @override
  State<AddLimePickle> createState() => _AddLimePickleState();
}

class _AddLimePickleState extends State<AddLimePickle> {
  TextEditingController name = TextEditingController();
  TextEditingController exp = TextEditingController();
  TextEditingController available = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController about = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Egg'),
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(62, 202, 59, 100),
        ),
        body: Consumer3<AccessStorage, ServiceController, AuthController>(
          builder: (context, access, db, auth, child) => GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    const Color.fromARGB(117, 141, 230, 128).withOpacity(1),
                  ],
                ),
              ),
              child: Column(
                children: [
                  TxtField(
                      mycontroller: name,
                      maxlines: 1,
                      mylabel: 'Name',
                      type: TextInputType.text),
                  Text(auth.userName.toString()),
                  TxtField(
                      mycontroller: exp,
                      mylabel: 'Experiance',
                      type: TextInputType.number,
                      maxlines: 1,
                      ),
                  TxtField(
                      mycontroller: available,
                      mylabel: 'Available Time',
                       maxlines: 1,
                      type: TextInputType.text),
                 
                  TxtField(
                      mycontroller: phone,
                      mylabel: 'Phone Number',
                       maxlines: 1,
                      type: TextInputType.number),
                  TxtField(
                      mycontroller: about,
                      mylabel: 'About',
                      maxlines: 5,
                      type: TextInputType.text),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 12),
                      const Text('Upload Image'),
                      IconButton(
                          onPressed: () {
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
                                                access.pickImage(
                                                    ImageSource.camera);
                                                Navigator.pop(context);
                                              },
                                              child: const ListTile(
                                                leading: Icon(Icons.camera),
                                                title: Text('Camera'),
                                              )),
                                          GestureDetector(
                                              onTap: () {
                                                access.pickImage(
                                                    ImageSource.gallery);
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
                          icon: const Icon(Icons.camera_alt_outlined)),
                    ],
                  ),
                  TextButton(
                      onPressed: () {
                        db.addLimePickle(name.text, int.parse(exp.text), available.text,
                        access.imageUrl,about.text,phone.text);
                        available.clear();
                        exp.clear();
                        name.clear();
                        phone.clear();
                        FocusScope.of(context).unfocus();
                      },
                      child: const Text('Submit')),

                ],
              ),
            ),
          ),
        ));
  }
}