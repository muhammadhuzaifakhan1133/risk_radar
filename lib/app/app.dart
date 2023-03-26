import 'package:risk_radar/ui/add_friends_family/add_friends_family_view.dart';
import 'package:risk_radar/ui/disasters/disaster_detail_view.dart';
import 'package:risk_radar/ui/disasters/disasters_view.dart';
import 'package:risk_radar/ui/donate/donate_view.dart';
import 'package:risk_radar/ui/donation/donation_view.dart';
import 'package:risk_radar/ui/forget_password/forget_password_view.dart';
import 'package:risk_radar/ui/home/home_view.dart';
import 'package:risk_radar/ui/navigation_bar/navigation_bar_view.dart';
import 'package:risk_radar/ui/news/news_view.dart';
import 'package:risk_radar/ui/onboarding/onboarding_view.dart';
import 'package:risk_radar/ui/payment/payment_view.dart';
import 'package:risk_radar/ui/reset_password/reset_password_view.dart';
import 'package:risk_radar/ui/sign_in/sign_in_view.dart';
import 'package:risk_radar/ui/sign_up/sign_up_view.dart';
import 'package:risk_radar/ui/splash/splash_view.dart';
import 'package:risk_radar/ui/story/story_view.dart';
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
  MaterialRoute(page: NavigationBarView),
  MaterialRoute(page: DisastersView),
  MaterialRoute(page: DisasterDetailView),
  MaterialRoute(page: NewsView),
  MaterialRoute(page: AddFriendsFamilyView),
  MaterialRoute(page: DonateView),
  MaterialRoute(page: PaymentView),
  MaterialRoute(page: StoryView),
  MaterialRoute(page: DonationView),
], dependencies: [
  LazySingleton(classType: NavigationService),
])
class App {}
