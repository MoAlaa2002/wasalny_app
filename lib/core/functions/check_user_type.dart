import 'package:cloud_firestore/cloud_firestore.dart';

checkUserType({
  required String fullName,
  required String email,
  required String phoneNumber,
  required String userType,
}) {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  users.add({
    'name': fullName,
    'email': email,
    'phoneNumber': phoneNumber,
    'userType': userType,
  });
}
