


import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/blocs/User/user_events.dart';
import 'package:flutter_bloc_demo/blocs/User/user_states.dart';
import 'package:flutter_bloc_demo/blocs/UserDetails/user_details_events.dart';
import 'package:flutter_bloc_demo/blocs/UserDetails/user_details_states.dart';
import 'package:flutter_bloc_demo/models/UserModel.dart';
import 'package:flutter_bloc_demo/repos/Repository.dart';


class UserListBloc extends Bloc<UserEvent,UserState>{

  final Repository _repository;

  UserListBloc(this._repository):super(UserLoadingState()){
   on<UserLoadingEvent>((event, emit) async {
     emit(UserLoadingState());
     try{
       final users = await _repository.getUser(1);

        emit(UserLoadedState(users));
     }catch(e){
       if (kDebugMode) {
         print("${e}");

       }
       emit(UserLoadingStateError(e.toString()));
     }
   });
  }



}


class UserDetailsBloc extends Bloc<UserDetailsEvent,UserDetailsState>{

  final Repository _repository;

  UserDetailsBloc(this._repository):super(UserDetailsLoadingState()){
    on<UserDetailsLoadingEvent>((event, emit) async {
      emit(UserDetailsLoadingState());
      try{
        final users = await _repository.getDetailsUser(event.id);

        emit(UserDetailsLoadedState(users));
      }catch(e){
        if (kDebugMode) {
          print("${e}");

        }
        emit(UserDetailsLoadingStateError(e.toString()));
      }
    });
  }



}