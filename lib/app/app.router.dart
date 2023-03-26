// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i18;
import 'package:flutter/material.dart';
import 'package:risk_radar/model/disaster_model.dart' as _i20;
import 'package:risk_radar/ui/add_friends_family/add_friends_family_view.dart'
    as _i13;
import 'package:risk_radar/ui/disasters/disaster_detail_view.dart' as _i11;
import 'package:risk_radar/ui/disasters/disaster_enum.dart' as _i19;
import 'package:risk_radar/ui/disasters/disasters_view.dart' as _i10;
import 'package:risk_radar/ui/donate/donate_view.dart' as _i14;
import 'package:risk_radar/ui/donation/donation_view.dart' as _i17;
import 'package:risk_radar/ui/forget_password/forget_password_view.dart' as _i7;
import 'package:risk_radar/ui/navigation_bar/navigation_bar_view.dart' as _i9;
import 'package:risk_radar/ui/news/news_view.dart' as _i12;
import 'package:risk_radar/ui/onboarding/onboarding_view.dart' as _i3;
import 'package:risk_radar/ui/payment/payment_view.dart' as _i15;
import 'package:risk_radar/ui/reset_password/reset_password_view.dart' as _i6;
import 'package:risk_radar/ui/sign_in/sign_in_view.dart' as _i4;
import 'package:risk_radar/ui/sign_up/sign_up_view.dart' as _i5;
import 'package:risk_radar/ui/splash/splash_view.dart' as _i2;
import 'package:risk_radar/ui/story/story_view.dart' as _i16;
import 'package:risk_radar/ui/verify_user/verify_user_view.dart' as _i8;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i21;

class Routes {
  static const splashView = '/';

  static const onBoardingView = '/on-boarding-view';

  static const signInView = '/sign-in-view';

  static const signUpView = '/sign-up-view';

  static const resetPasswordView = '/reset-password-view';

  static const forgetPasswordView = '/forget-password-view';

  static const verifyUserView = '/verify-user-view';

  static const navigationBarView = '/navigation-bar-view';

  static const disastersView = '/disasters-view';

  static const disasterDetailView = '/disaster-detail-view';

  static const newsView = '/news-view';

  static const addFriendsFamilyView = '/add-friends-family-view';

  static const donateView = '/donate-view';

  static const paymentView = '/payment-view';

  static const storyView = '/story-view';

  static const donationView = '/donation-view';

  static const all = <String>{
    splashView,
    onBoardingView,
    signInView,
    signUpView,
    resetPasswordView,
    forgetPasswordView,
    verifyUserView,
    navigationBarView,
    disastersView,
    disasterDetailView,
    newsView,
    addFriendsFamilyView,
    donateView,
    paymentView,
    storyView,
    donationView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.splashView,
      page: _i2.SplashView,
    ),
    _i1.RouteDef(
      Routes.onBoardingView,
      page: _i3.OnBoardingView,
    ),
    _i1.RouteDef(
      Routes.signInView,
      page: _i4.SignInView,
    ),
    _i1.RouteDef(
      Routes.signUpView,
      page: _i5.SignUpView,
    ),
    _i1.RouteDef(
      Routes.resetPasswordView,
      page: _i6.ResetPasswordView,
    ),
    _i1.RouteDef(
      Routes.forgetPasswordView,
      page: _i7.ForgetPasswordView,
    ),
    _i1.RouteDef(
      Routes.verifyUserView,
      page: _i8.VerifyUserView,
    ),
    _i1.RouteDef(
      Routes.navigationBarView,
      page: _i9.NavigationBarView,
    ),
    _i1.RouteDef(
      Routes.disastersView,
      page: _i10.DisastersView,
    ),
    _i1.RouteDef(
      Routes.disasterDetailView,
      page: _i11.DisasterDetailView,
    ),
    _i1.RouteDef(
      Routes.newsView,
      page: _i12.NewsView,
    ),
    _i1.RouteDef(
      Routes.addFriendsFamilyView,
      page: _i13.AddFriendsFamilyView,
    ),
    _i1.RouteDef(
      Routes.donateView,
      page: _i14.DonateView,
    ),
    _i1.RouteDef(
      Routes.paymentView,
      page: _i15.PaymentView,
    ),
    _i1.RouteDef(
      Routes.storyView,
      page: _i16.StoryView,
    ),
    _i1.RouteDef(
      Routes.donationView,
      page: _i17.DonationView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.SplashView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.SplashView(),
        settings: data,
        maintainState: false,
      );
    },
    _i3.OnBoardingView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.OnBoardingView(),
        settings: data,
        maintainState: false,
      );
    },
    _i4.SignInView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.SignInView(),
        settings: data,
        maintainState: false,
      );
    },
    _i5.SignUpView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.SignUpView(),
        settings: data,
        maintainState: false,
      );
    },
    _i6.ResetPasswordView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.ResetPasswordView(),
        settings: data,
        maintainState: false,
      );
    },
    _i7.ForgetPasswordView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.ForgetPasswordView(),
        settings: data,
        maintainState: false,
      );
    },
    _i8.VerifyUserView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.VerifyUserView(),
        settings: data,
        maintainState: false,
      );
    },
    _i9.NavigationBarView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.NavigationBarView(),
        settings: data,
        maintainState: false,
      );
    },
    _i10.DisastersView: (data) {
      final args = data.getArgs<DisastersViewArguments>(nullOk: false);
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i10.DisastersView(key: args.key, type: args.type),
        settings: data,
        maintainState: false,
      );
    },
    _i11.DisasterDetailView: (data) {
      final args = data.getArgs<DisasterDetailViewArguments>(nullOk: false);
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => _i11.DisasterDetailView(
            key: args.key, disaster: args.disaster, type: args.type),
        settings: data,
        maintainState: false,
      );
    },
    _i12.NewsView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.NewsView(),
        settings: data,
        maintainState: false,
      );
    },
    _i13.AddFriendsFamilyView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.AddFriendsFamilyView(),
        settings: data,
        maintainState: false,
      );
    },
    _i14.DonateView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.DonateView(),
        settings: data,
        maintainState: false,
      );
    },
    _i15.PaymentView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i15.PaymentView(),
        settings: data,
        maintainState: false,
      );
    },
    _i16.StoryView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i16.StoryView(),
        settings: data,
        maintainState: false,
      );
    },
    _i17.DonationView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i17.DonationView(),
        settings: data,
        maintainState: false,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class DisastersViewArguments {
  const DisastersViewArguments({
    this.key,
    required this.type,
  });

  final _i18.Key? key;

  final _i19.DisasterType type;

  @override
  String toString() {
    return '{"key": "$key", "type": "$type"}';
  }
}

class DisasterDetailViewArguments {
  const DisasterDetailViewArguments({
    this.key,
    required this.disaster,
    required this.type,
  });

  final _i18.Key? key;

  final _i20.DisasterModel disaster;

  final _i19.DisasterType type;

  @override
  String toString() {
    return '{"key": "$key", "disaster": "$disaster", "type": "$type"}';
  }
}

extension NavigatorStateExtension on _i21.NavigationService {
  Future<dynamic> navigateToSplashView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOnBoardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.onBoardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignInView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.signInView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignUpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.signUpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToResetPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.resetPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToForgetPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.forgetPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVerifyUserView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.verifyUserView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNavigationBarView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.navigationBarView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDisastersView({
    _i18.Key? key,
    required _i19.DisasterType type,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.disastersView,
        arguments: DisastersViewArguments(key: key, type: type),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDisasterDetailView({
    _i18.Key? key,
    required _i20.DisasterModel disaster,
    required _i19.DisasterType type,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.disasterDetailView,
        arguments: DisasterDetailViewArguments(
            key: key, disaster: disaster, type: type),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNewsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.newsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddFriendsFamilyView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.addFriendsFamilyView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDonateView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.donateView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPaymentView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.paymentView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStoryView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.storyView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDonationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.donationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplashView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splashView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOnBoardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.onBoardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSignInView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.signInView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSignUpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.signUpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithResetPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.resetPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithForgetPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.forgetPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithVerifyUserView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.verifyUserView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNavigationBarView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.navigationBarView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDisastersView({
    _i18.Key? key,
    required _i19.DisasterType type,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.disastersView,
        arguments: DisastersViewArguments(key: key, type: type),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDisasterDetailView({
    _i18.Key? key,
    required _i20.DisasterModel disaster,
    required _i19.DisasterType type,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.disasterDetailView,
        arguments: DisasterDetailViewArguments(
            key: key, disaster: disaster, type: type),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNewsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.newsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddFriendsFamilyView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.addFriendsFamilyView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDonateView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.donateView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPaymentView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.paymentView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStoryView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.storyView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDonationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.donationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
