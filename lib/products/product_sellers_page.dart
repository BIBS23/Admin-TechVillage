import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techvillage_admin/Utils/contact_tile.dart';
import 'package:techvillage_admin/screens/profile_screen.dart';

class SellersPage extends StatefulWidget {
  final String? profimg;
  final String? prodtitle;
  final String? phone;
  final String? rate;
  final String? exp;
  final String? avail;
  final String collectionRef;

  const SellersPage({
    Key? key,
    required this.collectionRef,
    this.prodtitle,
    this.profimg,
    this.phone,
    this.rate,
    this.exp,
    this.avail,
  }) : super(key: key);

  @override
  State<SellersPage> createState() => _SellersPageState();
}

class _SellersPageState extends State<SellersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(62, 202, 59, 100),
          title: Text(widget.prodtitle.toString(),
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, color: Colors.white)),
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('products')
                .doc(widget.collectionRef)
                .collection('sellers')
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CupertinoActivityIndicator());
              } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(child: Text('No data'));
              } else {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final DocumentSnapshot documentSnapshot =
                            snapshot.data!.docs[index];
                        return GestureDetector(onLongPress: () {
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
                                          .collection('products')
                                          .doc(widget.collectionRef)
                                          .collection('sellers')
                                          .doc(documentSnapshot.id)
                                          .delete();

                                      Navigator.pop(
                                          context); // Close the dialog
                                    },
                                    child: const Text('Delete'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(
                                          context); // Close the dialog
                                    },
                                    child: const Text('Cancel'),
                                  ),
                                ],
                              );
                            },
                          );
                         
                        },
                         child:
                          ContactTile(
                            istrue: true,
                            name: documentSnapshot['sellername'],
                            phoneNumber: documentSnapshot['phone'],
                            rate: documentSnapshot['rate'],
                            profimg: documentSnapshot['profimg'],
                            route: ProfilePage(
                              profimg: documentSnapshot['profimg'],
                              name: documentSnapshot['sellername'],
                              profile: documentSnapshot['about'],
                              collection1: 'products',
                              collection2: 'sellers',
                              document: widget.collectionRef,
                            ),
                          ),
                        );
                      }),
                );
              }
            }));
  }
}
