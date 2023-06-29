import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:techvillage_admin/Utils/products_bottomsheet.dart';
import 'package:techvillage_admin/controller/access_controller.dart';
import 'package:techvillage_admin/products/product_sellers_page.dart';
import '../Utils/prod_service_tile.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController prodcontroller = TextEditingController();

  late Stream<QuerySnapshot> _stream;
  FocusNode inputNode = FocusNode();

  bool expand = false;

  @override
  void initState() {
    super.initState();
    _stream = FirebaseFirestore.instance.collection('products').snapshots();
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
    prodcontroller.dispose();
  }

  void _handleSearch(String searchText) {
    if (searchText.isEmpty) {
      setState(() {
        _stream = FirebaseFirestore.instance.collection('products').snapshots();
      });
    } else {
      String firstLetter = searchText.substring(0, 1).toLowerCase();
      String secondLetter = searchText.length >= 2
          ? searchText.substring(1, 2).toLowerCase()
          : "";
      String thirdLetter = searchText.length >= 3
          ? searchText.substring(2, 3).toLowerCase()
          : "";
      String fourthLetter = searchText.length >= 4
          ? searchText.substring(3, 4).toLowerCase()
          : "";

      setState(() {
        _stream = FirebaseFirestore.instance
            .collection('products')
            .where(FieldPath.documentId,
                isGreaterThanOrEqualTo:
                    firstLetter + secondLetter + thirdLetter + fourthLetter)
            .where(FieldPath.documentId,
                isLessThan:
                    '$firstLetter$secondLetter$thirdLetter${fourthLetter}z')
            .snapshots();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String appTitle = 'Products';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(62, 202, 59, 100),
        title: expand
            ? null
            : Text(appTitle,
                style: const TextStyle(fontSize: 20, letterSpacing: 2)),
        centerTitle: true,
        flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          background: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: expand ? MediaQuery.of(context).size.width : 0,
            child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 100),
              child: expand
                  ? TextField(
                      focusNode: inputNode,
                      controller: _searchController,
                      onChanged: _handleSearch,
                      style: const TextStyle(
                          fontSize: 18, letterSpacing: 2, color: Colors.white),
                      decoration: InputDecoration(
                          hintText: expand ? 'search for products' : null,
                          hintStyle: const TextStyle(
                              fontSize: 16,
                              letterSpacing: 2,
                              color: Color.fromARGB(172, 255, 255, 255)),
                          border: InputBorder.none))
                  : null,
            ),
          ),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      expand = !expand;
                    });
                    _searchController.clear();
                    _stream = FirebaseFirestore.instance
                        .collection('products')
                        .snapshots();
                  },
                  icon: Icon(expand ? Icons.close : Icons.search)))
        ],
        leading: IconButton(
            icon: Text('Ads'),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                builder: (BuildContext context) {
                  String? selectedValue;
                  return Consumer<AccessStorage>(
                      builder: (context, access, child) {
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
                              child: Text('Add Advertisement',
                                  style: TextStyle(
                                      fontSize: 15, letterSpacing: 2))),
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
                          RadioListTile(
                            title: Text('Advertisement 1'),
                            value: 'ad1',
                            groupValue: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text('Advertisement 2'),
                            value: 'ad2',
                            groupValue: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text('Advertisement 3'),
                            value: 'ad3',
                            groupValue: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value;
                              });
                            },
                          ),
                          const SizedBox(height: 26),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                splashFactory: NoSplash.splashFactory,
                                backgroundColor:
                                    const Color.fromRGBO(69, 160, 54, 100),
                                minimumSize: const Size(200, 55),
                                disabledBackgroundColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              icon: const Icon(Icons.add),
                              label: const Text(
                                'Add service',
                                style:
                                    TextStyle(fontSize: 15, letterSpacing: 2),
                              ),
                              onPressed: () {
                                FirebaseFirestore.instance
                                    .collection('advertisement')
                                    .doc(selectedValue.toString().toLowerCase())
                                    .update({
                                  selectedValue.toString().toLowerCase():
                                      access.imageUrl
                                });
                                Navigator.pop(context);
                              },
                            ),
                          )
                        ],
                      ),
                    );
                  });
                },
              );
            }),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _stream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CupertinoActivityIndicator());
                  } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text('No data'));
                  } else {
                    return GridView.builder(
                      itemCount: snapshot.data!.docs.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 120,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        DocumentSnapshot documentSnapshot =
                            snapshot.data!.docs[index];

                        return GestureDetector(
                          onDoubleTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SellersPage(
                                          collectionRef: documentSnapshot.id,
                                          prodtitle:
                                              documentSnapshot['prodtitle'],
                                        )));
                          },
                          onLongPress: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Delete Item'),
                                  content: const Text(
                                      'Are you sure you want to delete this products?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        FirebaseFirestore.instance
                                            .collection('products')
                                            .doc(documentSnapshot.id)
                                            .collection('sellers')
                                            .get()
                                            .then((querySnapshot) {
                                          querySnapshot.docs.forEach((doc) {
                                            doc.reference.delete();
                                          });
                                        }).then((_) {
                                          FirebaseFirestore.instance
                                              .collection('products')
                                              .doc(documentSnapshot.id)
                                              .delete();
                                        });

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
                          child: ProdServiceTile(
                            image: documentSnapshot['prodimg'],
                            title: documentSnapshot['prodtitle'],
                            docid: documentSnapshot.id,
                            appTitle: appTitle,
                            widget: SellersPage(
                              collectionRef: documentSnapshot.id,
                              prodtitle: documentSnapshot['prodtitle'],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromRGBO(62, 202, 59, 100),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          onPressed: () {
            ModalSheet modal = ModalSheet();
            modal.showModalSheet(context, prodcontroller);
          },
          child: const Icon(Icons.add)),
    );
  }
}
