import 'package:equatable/equatable.dart';
import 'package:metaway_holdings/core/base_cubit/base_cubit.dart';
import 'package:metaway_holdings/feature/authentication/domain/user_repository.dart';

part 'user_state.dart';

class UserCubit extends BaseCubit<UserState> {
  UserCubit() : super(UserInitial()) {
    emit(UserInitial());
  }

  final UserRepository _userRepository = UserImp();
}
