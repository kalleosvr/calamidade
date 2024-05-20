import 'package:coopartilhar/app/features/ask_help/data/repositories/i_new_ask_help_repository.dart';
import 'package:coopartilhar/app/features/ask_help/data/repositories/new_ask_help_repository_impl.dart';
import 'package:coopartilhar/app/features/ask_help/interactor/controllers/ask_help_controller.dart';
import 'package:coopartilhar/app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:coopartilhar/app/features/auth/interactor/controllers/login_controller_impl.dart';
import 'package:coopartilhar/app/features/auth/interactor/repositories/i_auth_repository.dart';
import 'package:coopartilhar/app/features/check_affiliated/data/check_affiliated_repository_impl.dart';
import 'package:coopartilhar/app/features/check_affiliated/data/i_check_affiliated_repository.dart';
import 'package:coopartilhar/app/features/check_affiliated/interactor/check_affiliated_controller.dart';
import 'package:coopartilhar/app/features/home/data/home_repository_impl.dart';
import 'package:coopartilhar/app/features/home/interactor/home_interactor.dart';
import 'package:coopartilhar/app/features/home/interactor/interfaces/i_home_repository.dart';
import 'package:coopartilhar/app/features/onboarding/data/onboarding_repository_impl.dart';
import 'package:coopartilhar/app/features/onboarding/interactor/controllers/onboarding_controller.dart';
import 'package:coopartilhar/app/features/onboarding/interactor/interface/i_onboarding_repository.dart';
import 'package:coopartilhar/app/features/register/data/repositories/register_assisted_repository_impl.dart';
import 'package:coopartilhar/app/features/register/interactor/controllers/register_controller.dart';
import 'package:coopartilhar/app/features/register/interactor/repositories/i_register_repository.dart';
import 'package:coopartilhar/app/features/request_details/data/i_request_details_repository.dart';
import 'package:coopartilhar/app/features/request_details/data/request_details_repository_impl.dart';
import 'package:coopartilhar/app/features/request_details/interactor/request_details_controller.dart';
import 'package:core_module/core_module.dart';

final injector = AutoInjector(
  on: (injector) {
    injector.addInjector(coreModule);
    injector.add(HomeInteractor.new);
    injector.add<IHomeRepository>(HomeRepositoryImpl.new);
    injector.addSingleton<IRegisterRepository>(RegisterRepositoryImpl.new);
    injector.addSingleton<RegisterController>(RegisterController.new);
    injector.add<IOnboardingRepository>(OnboardingRepositoryImpl.new);
    injector.addSingleton<IAuthRepository>(AuthRepositoryImpl.new);
    injector.addLazySingleton<OnboardingController>(OnboardingController.new);
    injector.addLazySingleton<LoginControllerImpl>(LoginControllerImpl.new);
    injector.addLazySingleton<ICheckAffiliatedRepository>(
        CheckAffiliatedRepositoryImpl.new);
    injector.addLazySingleton<CheckAffiliatedController>(
        CheckAffiliatedController.new);
    injector.addLazySingleton<IRequestDetailsRepository>(
        RequestDetailsRepositoryImpl.new);
    injector.addLazySingleton<RequestDetailsController>(
        RequestDetailsController.new);
    injector.addLazySingleton<INewAskHelpRepository>(NewAskHelpRepositoryImpl.new);
    injector.addLazySingleton<AskHelpController>(AskHelpController.new);
    injector.commit();
  },
);
