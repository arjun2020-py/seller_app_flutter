import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seller/LoginScrren/view/bloc/login_auth_bloc.dart';
import 'package:seller/home/view/home_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final fromKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController(),
      passwrodController = TextEditingController();

  void validateTextfiled() {
    if (fromKey.currentState!.validate()) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Succfully login")));
    }
  }

  final _loginAuth = LoginAuthBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _loginAuth,
      child: BlocListener<LoginAuthBloc, LoginAuthState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is LoginSucess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          } else if (state is LoginFailed) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: Form(
              key: fromKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Image.asset("assets/images/log1.png"),
                            const Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Login to your account",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.grey[70]),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: "Email",
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon: const Icon(Icons.person)),
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
                        ElevatedButton(
                            onPressed: () => _loginAuth.add(LoginEvent(
                                email: emailController.text,
                                passwrod: passwrodController.text)),
                            child: Text("Login")),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Forgot passwrod",
                                  style: TextStyle(fontSize: 15),
                                )),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .popAndPushNamed("Register");
                                },
                                child: const Text(
                                  "Siginup",
                                  style: TextStyle(fontSize: 15),
                                ))
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
    );
  }
}
