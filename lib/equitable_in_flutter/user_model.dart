import 'package:equatable/equatable.dart';

class UserModel {
  final int id;
  final String name;

  UserModel({required this.id, required this.name});

  // @override
  // bool operator ==(Object other) =>
  //     identical(this, other) ||
  //     other is UserModel &&
  //         runtimeType == other.runtimeType &&
  //         id == other.id &&
  //         name == other.name;
}

//instead of overriding the == operator, we can use the Equatable package
class UserModelEquatable extends Equatable {
  final int id;
  final String name;
  UserModelEquatable({required this.id, required this.name});
  @override
  List<Object?> get props => [id, name];
}
  // This will automatically handle equality checks based on the properties defined in the props list.

  