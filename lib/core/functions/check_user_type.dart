import 'package:cloud_firestore/cloud_firestore.dart';

checkUserType({
  required String fullName,
  required String email,
  required String phoneNumber,
  required String userType,
  required String userId,
}) async {
  print("📝 Saving user to Firestore for UID: $userId");

  try {
    final users = FirebaseFirestore.instance.collection('users').doc(userId);

    await users.set({
      'name': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
      'userType': userType,
    });
  } catch (e) {
    print("❌ Error saving user: $e");
  }
}
