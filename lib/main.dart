import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wasalny_app/app/wasalny_app.dart';
import 'package:wasalny_app/core/helpers/di/dependency_injection.dart';
import 'package:wasalny_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  setup();

  runApp(const WasalnyApp());
}
