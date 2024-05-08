import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_web/home.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyCyp2YY7Ce4lSmgh9e8fIrmrgj9k0PreJ4",
        appId: "1:288082503186:web:fe8a19ddf5a017076f1acb",
        messagingSenderId: "288082503186",
        storageBucket: "web-project-be286.appspot.com",
        projectId: "web-project-be286")
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
