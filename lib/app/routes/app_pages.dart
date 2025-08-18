import 'package:get/get.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/campaigns/views/campaigns_view.dart';
import '../modules/info/views/info_view.dart';
import '../modules/basic_info/views/basic_info_view.dart';
import '../modules/password/views/password_view.dart';

import 'app_routes.dart';

class AppPages {
  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(), // <— add this
    ),
    GetPage(
      name: Routes.profile,
      page: () => const ProfileView(),
      binding: ProfileBinding(), // <-- add this
    ),
    GetPage(name: Routes.campaigns, page: () => const CampaignsView()),
    GetPage(name: Routes.info, page: () => const InfoView()),
    GetPage(name: Routes.basicInfo, page: () => const BasicInfoView()),
    GetPage(name: Routes.password, page: () => const PasswordView()),
  ];
}
