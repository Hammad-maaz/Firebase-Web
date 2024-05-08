import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_web/dashboard.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController emailController = TextEditingController();
  TextEditingController emailLoginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordLoginController = TextEditingController();
  final auth = FirebaseAuth.instance;
  bool loading  = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          ///Email Controller
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              hintText: 'Enter Email Address'
            ),
          ),

          ///Password Controller
          TextFormField(
            controller: passwordController,
            decoration: const InputDecoration(
                hintText: 'Enter Password'
            ),
          ),
          ElevatedButton(
              onPressed: (){
                setState(() {
                  loading = true;
                });
                auth.createUserWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text).then((value) {
                  setState(() {
                    loading = false;
                  });
                }).onError((error, stackTrace) {
                  setState(() {
                    loading = false;
                  });
                });
              },
              child: loading ? const Text('Please Wait...') : const Text('Create User')),
          SizedBox(height: 100),


          ///Email Controller
          TextFormField(
            controller: emailLoginController,
            decoration: const InputDecoration(
                hintText: 'Enter Email Address'
            ),
          ),

          ///Password Controller
          TextFormField(
            controller: passwordLoginController,
            decoration: const InputDecoration(
                hintText: 'Enter Password'
            ),
          ),


          ElevatedButton(
              onPressed: (){
                setState(() {
                  loading = true;
                });
                auth.signInWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text).then((value) {
                      setState(() {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => Dashboard()));
                        loading = false;
                      });
                }).onError((error, stackTrace) {
                  setState(() {
                    loading = false;
                  });
                });
              },
              child: loading ? const Text('Please Wait...') : const Text('Login User'))
        ],
      ),
    );
  }
}
