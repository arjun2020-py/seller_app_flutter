import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seller/LoginScrren/view/login_scrren.dart';
import 'package:seller/SiginupScreen/view/bloc/siginup_auth_bloc.dart';

class SiginupScreen extends StatefulWidget {
  const SiginupScreen({super.key});

  @override
  State<SiginupScreen> createState() => _SiginupScreenState();
}

class _SiginupScreenState extends State<SiginupScreen> {
  TextEditingController emailController = TextEditingController(),
      userController = TextEditingController(),
      mobilController = TextEditingController(),
      passwrodController = TextEditingController(),
      confrompasswordCntroller = TextEditingController();

  final fromkey = GlobalKey<FormState>();

  void validateTextfiled() {
    if (fromkey.currentState!.validate()) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Succfully reisgter")));
    }
  }

//1
  final _siginupBloc = SiginupAuthBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _siginupBloc,
      child: BlocListener<SiginupAuthBloc, SiginupAuthState>(
        listener: (context, state) {
          if (state is SiginupSucess) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ));
          } else if (state is SiginupFailed) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorMessgae)));
          }
        },
        child: Scaffold(
          body: SingleChildScrollView(
            // physics: const AlwaysScrollableScrollPhysics(),
            child: SafeArea(
              child: Form(
                key: fromkey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Column(
                            children: [
                              const SizedBox(
                                height: 0,
                              ),
                              Image.asset(
                                "assets/images/log1.png",
                              ),
                              const Text(
                                "Siginup",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Register to your account",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey[70]),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          TextFormField(
                            controller: userController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText: "Username",
                                filled: true,
                                fillColor: Colors.white,
                                suffixIcon:
                                    const Icon(Icons.person_add_alt_1_rounded)),
                            validator: (value) {
                              if (value!.isEmpty ||
                                  RegExp(r'^[a-zA-Z0-9]+([._]?[a-zA-Z0-9]+)*$')
                                      .hasMatch(value)) {
                                return "Please enter valid username";
                              }
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: "Email",
                                filled: true,
                                fillColor: Colors.white,
                                suffixIcon: const Icon(
                                    Icons.mark_email_unread_outlined)),
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$')
                                      .hasMatch(value)) {
                                return 'Please Enter vaild email address';
                              }
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: mobilController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: "Mobilno",
                                filled: true,
                                fillColor: Colors.white,
                                suffixIcon: const Icon(Icons.mobile_friendly)),
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^(\+\d{1,3}[- ]?)?\d{10}$')
                                      .hasMatch(value)) {
                                return "Wrong  mobile number ";
                              }
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: passwrodController,
                            obscureText: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: "Passwrod",
                                filled: true,
                                fillColor: Colors.white,
                                suffixIcon: const Icon(Icons.remove_red_eye)),
                            validator: (value) {
                              if (value!.length <= 6) {
                                return 'Should be atleast 6 charcaters';
                              }
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: confrompasswordCntroller,
                            obscureText: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: "ConfromPasswrod",
                                filled: true,
                                fillColor: Colors.white,
                                suffixIcon:
                                    const Icon(Icons.remove_red_eye_outlined)),
                            validator: (value) {
                              if (value != passwrodController.text) {
                                return "Passwrod is correct";
                              }
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // ignore: prefer_const_constructors
                          ElevatedButton(
                              onPressed: () => _siginupBloc.add(SiginupEvent(
                                    userName: userController.text,
                                    email: emailController.text,
                                    mobilNo: mobilController.text,
                                    passwrod: passwrodController.text,
                                    confromPass: confrompasswordCntroller.text,
                                  )),
                              child: const Text("Register")),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Alreday have an account"),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushNamed("Login");
                                  },
                                  child: const Text("Login"))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Future<void> CreateUsers(String name, String email, String passwrod,
//     String mobil, String confromPass, BuildContext context) async {
//   final auth = FirebaseAuth.instance;
//   final userRef = FirebaseFirestore.instance.collection('Users');

//   try {
//     await auth.createUserWithEmailAndPassword(email: email, password: passwrod);
//     await userRef.doc(auth.currentUser!.uid).set({
//       'userid': auth.currentUser!.uid,
//       'userName': name,
//       'email': email,
//       'mobil': mobil,
//       'passwrod': passwrod,
//       'confromPasswrod': confromPass,
//       'profileImage': '',
//     });
//     Navigator.pushNamed(context, 'Login');
//   } on FirebaseAuthException catch (e) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.code)));
//   }
// }
