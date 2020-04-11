import 'package:lofi/models/user.dart';
import 'package:meta/meta.dart';

@immutable
class UserState {
  final bool isError;
  final bool isLoading;
  final User user;

  UserState({
    this.isError,
    this.isLoading,
    this.user,
  });

  factory UserState.initial() => UserState(
    isLoading: false,
    isError: false,
    user: null,
  );

  UserState copyWith({
    @required bool isError,
    @required bool isLoading,
    @required User user,
  }) {
    return UserState(
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
    );
  }
}