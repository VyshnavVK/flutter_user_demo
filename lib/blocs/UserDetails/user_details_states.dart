

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc_demo/blocs/UserDetails/user_details_events.dart';
import 'package:flutter_bloc_demo/models/UserDetailsModel.dart';




@immutable
abstract class UserDetailsState extends Equatable{
  const UserDetailsState();
}

class UserDetailsLoadingState extends UserDetailsState{
  @override
  List<Object?> get props => [];

}class UserDetailsLoadedState extends UserDetailsState{
  const UserDetailsLoadedState(this.user);
  final UserDetailsModel user;

  @override
  List<Object?> get props => [user];


}


class UserDetailsLoadingStateError extends UserDetailsState{
  const UserDetailsLoadingStateError(this.error);
  final String error;
  @override
  List<Object?> get props => [error];

}


