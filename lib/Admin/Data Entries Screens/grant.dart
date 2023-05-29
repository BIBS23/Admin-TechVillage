import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techvillage_admin/Admin/provider/dbcontroller.dart';
import 'package:techvillage_admin/Admin/provider/login_controller.dart';
import '../provider/media_access.dart';
import '../utils/txtfield.dart';

class AddGrants extends StatefulWidget {
  const AddGrants({
    super.key,
  });

  @override
  State<AddGrants> createState() => _AddGrantsState();
}

class _AddGrantsState extends State<AddGrants> {
  TextEditingController grant = TextEditingController();
  TextEditingController exp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Grants'),
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
                      mycontroller: grant,
                      maxlines: 1,
                      mylabel: 'Grant Name',
                      type: TextInputType.text,
                      textInputAction: TextInputAction.newline,

                      ),
               
                  TxtField(
                    mycontroller: exp,
                    mylabel: 'Last Date',
                    type: TextInputType.text,
                    maxlines: 1,
                  ),
                 
                    const  SizedBox(height: 40),
                    ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: const Size(140, 45)
                    ),
                      onPressed: () {
                        db.addGrants(grant.text, exp.text);
                        exp.clear();
                        grant.clear();
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
