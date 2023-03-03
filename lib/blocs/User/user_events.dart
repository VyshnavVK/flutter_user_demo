import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class UserEvent extends Equatable{
  const UserEvent();
}

class UserLoadingEvent extends UserEvent{
  @override
  List<Object?> get props => [];

}

class UserLoadedEvent extends UserEvent{
  @override
  List<Object?> get props => [];

}

class UserLoadingErrorEvent extends UserEvent{
  @override
  List<Object?> get props => [];

}

