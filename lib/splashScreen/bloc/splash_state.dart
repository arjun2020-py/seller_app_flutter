part of 'splash_bloc.dart';

@immutable
abstract class SplashState {}

class SplashInitial extends SplashState {}

//2
class NavigateLoginState extends SplashState {}

//create a state for persitance conatiner
class NaigateToHomeState extends SplashState {}
