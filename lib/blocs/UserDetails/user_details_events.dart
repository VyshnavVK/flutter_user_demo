import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class UserDetailsEvent extends Equatable{
  final int id;
  const UserDetailsEvent({required this.id});
}

class UserDetailsLoadingEvent extends UserDetailsEvent{
  const UserDetailsLoadingEvent({required super.id});

  @override
  List<Object?> get props => [];


}

