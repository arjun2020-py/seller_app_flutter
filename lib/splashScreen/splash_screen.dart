import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seller/LoginScrren/view/login_scrren.dart';
import 'package:seller/home/view/home_screen.dart';

import 'bloc/splash_bloc.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  //4
  final _splashBolc = SplashBloc();

  @override
  Widget build(BuildContext context) {
    //3
    return BlocProvider(
      create: (context) => _splashBolc
        ..add(NavigteToLoginEvent()), //object  singline use chyunoo

      //6
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          print(state);

          //7

          if (state is NaigateToHomeState) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ));
          } else {
             Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ));
          }
        },

        //scffold wrap with blocListner
        child: const Scaffold(
          body: Center(
            child: Text(
              'WELCOME',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ),
    );
  }
}
