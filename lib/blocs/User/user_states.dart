

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../models/UserModel.dart';


@immutable
abstract class UserState extends Equatable{
  const UserState();
}

class UserLoadingState extends UserState{
  @override
  List<Object?> get props => [];

}class UserLoadedState extends UserState{
  const UserLoadedState(this.users);
  final List<UserModel> users;
  @override
  List<Object?> get props => [users];

}


class UserLoadingStateError extends UserState{
  const UserLoadingStateError(this.error);
  final String error;
  @override
  List<Object?> get props => [error];

}