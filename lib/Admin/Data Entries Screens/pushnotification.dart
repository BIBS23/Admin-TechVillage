import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import '../utils/txtfield.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PushNotificationScreen extends StatefulWidget {
  const PushNotificationScreen({
    super.key,
  });

  @override
  State<PushNotificationScreen> createState() => _PushNotificationScreenState();
}

class _PushNotificationScreenState extends State<PushNotificationScreen> {
  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String? deviceToken = '';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Push Notification'),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(62, 202, 59, 100),
      ),
      body: GestureDetector(
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
                  mylabel: 'Title',
                  type: TextInputType.text),
              TxtField(
                  mycontroller: body,
                  mylabel: 'body',
                  maxlines: 5,
                  type: TextInputType.text),
              const SizedBox(height: 15),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: const Size(140, 45)),
                  onPressed: () {
                    try {
                      FirebaseMessaging.instance.getToken().then((value) async {
                        var data = {
                          'to': value.toString(),
                          'priority': 'high',
                          'notification': {
                            'title': 'Trial',
                            'body': 'This is a trial done by bibin'
                          }
                        };
                        final http.Response response = await http.post(
                            Uri.parse('https://fcm.googleapis.com/fcm/send'),
                            body: jsonEncode(data),
                            headers: {
                              'Content-Type': 'application/json; charset=UTF-8',
                              'Authorization':
                                  'key=AAAA7X0tUk4:APA91bG3LncHBujCO6Fz76SMR0eOWB2_bmXugGgVwdY4lPdWxr_TTBPh30BD_MWySaUUiny1KbsgzeUpGOXSuAb9uj8Tbl3w-qALDxDEhEQ3NjGtdUGiHYtKx4qaTq68uFcYvSkkf0Jm'
                            });
                        print(response.body);
                      });
                      print('Success');
                    } catch (e) {
                      print('Error Occured : ' '${e}');
                    }

                    title.clear();

                    body.clear();
                    FocusScope.of(context).unfocus();
                  },
                  child: const Text('Send')),
            ],
          ),
        ),
      ),
    );
  }
}
