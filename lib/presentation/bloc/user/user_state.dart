import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:laravel_user_management_mobile_app/domain/entities/user.dart';

import '../../../data/models/user_model.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    @Default([]) List<UserModel> users,
    UserModel? selectedUser,
    @Default(false) bool isLoading,
    @Default(false) bool hasReachedMax,
    @Default(1) int currentPage,
    String? error,
    String? successMessage,
  }) = _UserState;
}
