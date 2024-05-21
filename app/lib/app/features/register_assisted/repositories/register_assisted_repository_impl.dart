import 'package:coopartilhar/app/features/register_assisted/repositories/i_register_assisted_repository.dart';
import 'package:core_module/core_module.dart';

class RegisterAssistedRepositoryImpl extends IRegisterAssistedRepository {
  RegisterAssistedRepositoryImpl({
    required this.client,
  });

  final IRestClient client;

  @override
  Future<Output<UserEntity>> register({
    required UserEntity assisted,
  }) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
