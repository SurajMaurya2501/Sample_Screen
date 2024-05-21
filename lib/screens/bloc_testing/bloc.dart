
import 'package:flutter_bloc/flutter_bloc.dart';

enum CounterEvent { increment , decrement }

class BlocTestingProvider extends Bloc<CounterEvent,int>{
  BlocTestingProvider() :super(0){
    on<CounterEvent>((event, emit) {
      switch (event){
        case CounterEvent.increment:
        emit(state + 1);
        break;
        case CounterEvent.decrement:
        emit(state - 1);;
        break;
      }
    });
  }

}