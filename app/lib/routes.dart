import 'package:coopartilhar/app/(public)/affiliated_first_action/affiliated_first_action_page.dart'
    as a0;
import 'package:coopartilhar/app/(public)/auth/affiliated/affiliated_page.dart'
    as a2;
import 'package:coopartilhar/app/(public)/auth/check_affiliated/check_affiliated_page.dart'
    as a3;
import 'package:coopartilhar/app/(public)/auth/login/login_page.dart' as a4;
import 'package:coopartilhar/app/(public)/auth/not_affiliated/not_affiliated_page.dart'
    as a5;
import 'package:coopartilhar/app/(public)/auth/register/register_page.dart'
    as a6;
import 'package:coopartilhar/app/(public)/home/home_page.dart' as a7;
import 'package:coopartilhar/app/(public)/new_ask_help/new_ask_help_page.dart'
    as a1;
import 'package:coopartilhar/app/(public)/onboarding/onboarding_page.dart'
    as a8;
import 'package:coopartilhar/app/(public)/register_assistence/register_assistence_page.dart'
    as a9;
import 'package:coopartilhar/app/(public)/request_details/request_details_page.dart'
    as a10;
import 'package:coopartilhar/app/(public)/splash/splash_page.dart' as a11;
import 'package:coopartilhar/app/(public)/success_state/success_state_page.dart'
    as a12;
import 'package:coopartilhar/app/(public)/want_to_help/want_to_help_page.dart'
    as a13;
import 'package:coopartilhar/app/(public)/welcome/welcome_page.dart' as a14;
import 'package:core_module/core_module.dart';

List<RouteEntity> get routes => [
      RouteEntity(
        key: '/affiliated_first_action',
        uri: Uri.parse('/affiliated_first_action'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a0.AffiliatedFirstActionPage(),
        ),
      ),
      RouteEntity(
        key: '/new_ask_help',
        uri: Uri.parse('/new_ask_help'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a1.NewAskHelpPage(),
        ),
      ),
      RouteEntity(
        key: '/auth/affiliated',
        uri: Uri.parse('/auth/affiliated'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a2.AffiliatedPage(),
        ),
      ),
      RouteEntity(
        key: '/auth/check_affiliated',
        uri: Uri.parse('/auth/check_affiliated'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a3.CheckAffiliatedPage(),
        ),
      ),
      RouteEntity(
        key: '/auth/login',
        uri: Uri.parse('/auth/login'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a4.LoginPage(),
        ),
      ),
      RouteEntity(
        key: '/auth/not_affiliated',
        uri: Uri.parse('/auth/not_affiliated'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a5.NotAfilliatedPage(),
        ),
      ),
      RouteEntity(
        key: '/auth/register',
        uri: Uri.parse('/auth/register'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a6.RegisterPage(),
        ),
      ),
      RouteEntity(
        key: '/home',
        uri: Uri.parse('/home'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a7.HomePage(),
        ),
      ),
      RouteEntity(
        key: '/onboarding',
        uri: Uri.parse('/onboarding'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a8.OnboardingPage(),
        ),
      ),
      RouteEntity(
        key: '/register_assistence',
        uri: Uri.parse('/register_assistence'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a9.RegisterAssistencePage(),
        ),
      ),
      RouteEntity(
        key: '/request_details',
        uri: Uri.parse('/request_details'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a10.RequestDetailsPage(),
        ),
      ),
      RouteEntity(
        key: '/splash',
        uri: Uri.parse('/splash'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a11.SplashPage(),
        ),
      ),
      RouteEntity(
        key: '/success_state',
        uri: Uri.parse('/success_state'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a12.SuccessStatePage(),
        ),
      ),
      RouteEntity(
        key: '/want_to_help',
        uri: Uri.parse('/want_to_help'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a13.WantToHelpPage(),
        ),
      ),
      RouteEntity(
        key: '/welcome',
        uri: Uri.parse('/welcome'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a14.WelcomePage(),
        ),
      ),
    ];

const routePaths = (
  path: '/',
  auth: (
    path: '/auth',
    affiliated: '/auth/affiliated',
    checkAffiliated: '/auth/check_affiliated',
    login: '/auth/login',
    notAffiliated: '/auth/not_affiliated',
    register: '/auth/register',
  ),
  affiliatedFirstAction: '/affiliated_first_action',
  newAskHelp: '/new_ask_help',
  home: '/home',
  onboarding: '/onboarding',
  registerAssistence: '/register_assistence',
  requestDetails: '/request_details',
  splash: '/splash',
  successState: '/success_state',
  wantToHelp: '/want_to_help',
  welcome: '/welcome',
);
