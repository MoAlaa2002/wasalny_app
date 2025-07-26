import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wasalny_app/core/helpers/routing/routes_name.dart';
import 'package:wasalny_app/core/functions/snak_bar.dart';

Future<void> checkUserFunc(BuildContext context) async {
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    print("🔍 Checking Firestore for UID: ${user.uid}");
    try {
      final doc = (await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get());
      if (doc.exists) {
        final userType = doc['userType'];
        if (userType == 'rider') {
          context.goNamed(RoutesName.riderScreen);
        } else if (userType == 'driver') {
          context.goNamed(RoutesName.driverScreen);
        } else {
          print("unknown type");
        }
      } else {
        print("User Document Unfound");
      }
    } catch (e) {
      snackBar(msg: "Something went wrong: $e", context: context);
    }
  }
}
