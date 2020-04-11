import 'package:lofi/redux/user/state.dart';

import 'actions.dart';

userReducer(UserState prevState, SetUserStateAction action) {
  final payload = action.userState;
  return prevState.copyWith(
    isError: payload.isError,
    isLoading: payload.isLoading,
    user: payload.user,
  );
}
