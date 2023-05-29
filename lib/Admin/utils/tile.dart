import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTile extends StatelessWidget {
  final String image;
  final String title;
  final Widget route;
  const MyTile({
    super.key,
    required this.image,
    required this.title,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    void loader() {
      showDialog(
        context: context,
        barrierDismissible:
            false, // Prevent dismissing the dialog by tapping outside
        builder: (context) {
          return const CupertinoActivityIndicator(
            color: Colors.white,
            radius: 15,
          );
        },
      );
    }

    void stopLoader() {
      Navigator.pop(context); // Dismiss the loader dialog
    }

    return GestureDetector(
      onTap: () {
        loader();
        Timer(const Duration(seconds: 1), () {
          stopLoader();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => route));
        });
      },
      child: Card(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title.toString(),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
