import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:techvillage_admin/Admin/provider/dbcontroller.dart';
import 'package:techvillage_admin/Admin/provider/login_controller.dart';
import '../provider/media_access.dart';
import '../utils/txtfield.dart';

class AddNews extends StatefulWidget {
  const AddNews({
    super.key,
  });

  @override
  State<AddNews> createState() => _AddNewsState();
}

class _AddNewsState extends State<AddNews> {
  TextEditingController title = TextEditingController();
  TextEditingController about = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('News'),
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
                      mycontroller: title,
                      maxlines: 1,
                      mylabel: 'Heading',
                      type: TextInputType.text),
                  TxtField(
                      mycontroller: about,
                      mylabel: 'About',
                      maxlines: 5,
                      type: TextInputType.text),
                  const SizedBox(height: 15),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          minimumSize: const Size(140, 45)),
                      onPressed: () {
                        db.addNews(title.text, about.text);

                        title.clear();
                       
                        about.clear();
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
