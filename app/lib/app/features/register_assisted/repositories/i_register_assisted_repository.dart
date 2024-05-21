import 'package:core_module/core_module.dart';

abstract class IRegisterAssistedRepository {
  Future<Output<UserEntity>> register({
    required UserEntity assisted,
  });
}
