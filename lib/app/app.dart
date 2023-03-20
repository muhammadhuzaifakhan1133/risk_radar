import 'package:risk_radar/ui/forget_password/forget_password_view.dart';
import 'package:risk_radar/ui/onboarding/onboarding_view.dart';
import 'package:risk_radar/ui/reset_password/reset_password_view.dart';
import 'package:risk_radar/ui/sign_in/sign_in_view.dart';
import 'package:risk_radar/ui/sign_up/sign_up_view.dart';
import 'package:risk_radar/ui/splash/splash_view.dart';
import 'package:risk_radar/ui/verify_user/verify_user_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  MaterialRoute(page: SplashView, initial: true),
  MaterialRoute(page: OnBoardingView),
  MaterialRoute(page: SignInView),
  MaterialRoute(page: SignUpView),
  MaterialRoute(page: ResetPasswordView),
  MaterialRoute(page: ForgetPasswordView),
  MaterialRoute(page: VerifyUserView),
], dependencies: [
  LazySingleton(classType: NavigationService),
])
class App {}
