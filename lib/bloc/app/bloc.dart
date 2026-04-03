import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'event.dart';
part 'state.dart';

class AppBloc extends Bloc<AppBlocEvent, AppBlocState> {
  AppBloc() : super(AppBlocInitial()) {
    on<AppBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
