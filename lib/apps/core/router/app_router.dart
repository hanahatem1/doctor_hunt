import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/sign_up_screen.dart';
import '../../features/on_boarding/screens/onboarding_screen.dart';
import '../../features/role_selection/screens/role_selection_screen.dart';

part 'app_router.g.dart';

@TypedGoRoute<OnboardingRoute>(path: '/' ,)
class OnboardingRoute extends GoRouteData with _$OnboardingRoute {
  const OnboardingRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const OnboardingScreen();
}

@TypedGoRoute<RoleSelectionRoute>(path: '/roleSelection')
class RoleSelectionRoute extends GoRouteData with _$RoleSelectionRoute {
  const RoleSelectionRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const RoleSelectionScreen();
}

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData with _$LoginRoute {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const LoginPage();
}

@TypedGoRoute<SignUpRoute>(path: '/signUp')
class SignUpRoute extends GoRouteData with _$SignUpRoute {
  const SignUpRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SignUpPage();
}


abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: $appRoutes,
  );
}
