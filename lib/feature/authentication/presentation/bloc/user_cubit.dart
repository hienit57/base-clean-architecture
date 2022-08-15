import 'package:equatable/equatable.dart';
import 'package:base_clean_architecture/core/base_cubit/base_cubit.dart';
import 'package:base_clean_architecture/feature/authentication/domain/user_repository.dart';

part 'user_state.dart';

class UserCubit extends BaseCubit<UserState> {
  UserCubit() : super(UserInitial()) {
    emit(UserInitial());
  }

  final UserRepository _userRepository = UserImp();
}
