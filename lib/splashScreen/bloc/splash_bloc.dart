import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:seller/shredPrefrences/shared_pref.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    //4

    //stream of event come with 'on' keywrod.
    on<SplashEvent>((event, emit) async {
      print(event); //event = ui event save

      //5
      if (event is NavigteToLoginEvent) {
        await Future.delayed(const Duration(seconds: 5));

        //shred pefence code
        final data = await ShredPref().getUserData();
        print(data);

        if (data['isLogin'] == true) {
          emit(NaigateToHomeState());
        } else {
          emit(NavigateLoginState());
        }
      }
    });
  }
}
