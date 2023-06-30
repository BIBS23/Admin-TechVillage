import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techvillage_admin/Utils/add_grant.dart';
import 'package:techvillage_admin/Utils/granttile.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final TextEditingController grantcontroller = TextEditingController();
  final TextEditingController expcontroller = TextEditingController();
  final TextEditingController categorycontroller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    grantcontroller.dispose();
    expcontroller.dispose();
    categorycontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(62, 202, 59, 100),
        title: const Text(
          'Grants',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('grants')
              .orderBy('timestamp', descending: true)
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CupertinoActivityIndicator());
            }
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      snapshot.data!.docs[index];
                  return GestureDetector(
                    onLongPress: () {
                      String docid = documentSnapshot.id;

                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Delete Item'),
                            content: const Text(
                                'Are you sure you want to delete this seller?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  FirebaseFirestore.instance
                                      .collection('grants')
                                      .doc(docid)
                                      .delete();
                                  Navigator.pop(context);
                                },
                                child: const Text('Delete'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); // Close the dialog
                                  // Close the dialog
                                },
                                child: const Text('Cancel'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: GrantTile(
                      grant: documentSnapshot['grant'],
                      exp: documentSnapshot['exp'],
                      category: documentSnapshot['category'],
                    ),
                  );
                });
          }),
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromRGBO(62, 202, 59, 100),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          onPressed: () {
            AddGrantDetails grand = AddGrantDetails();
            grand.showModalSheet(
                context, grantcontroller, expcontroller, categorycontroller);
          },
          child: const Icon(Icons.add)),
    );
  }
}
