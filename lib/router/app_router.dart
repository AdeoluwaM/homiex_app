import 'package:auto_route/auto_route.dart';
import 'package:homix/pages/air_condition_page.dart';
import 'package:homix/pages/light_control_page.dart';
import 'package:homix/pages/music_control_page.dart';
import 'package:homix/pages/sign_in_page.dart';
import 'package:homix/pages/sign_up_page.dart';
import 'package:homix/pages/tv_control_page.dart';
import 'package:homix/pages/welcome_page.dart';
import 'package:homix/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:homix/services/auth_services.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AuthServicesRoute.page,
          initial: true,
        ),

        AutoRoute(page: SignInRoute.page),
        AutoRoute(page: SignUpRoute.page),

        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: AirConditionRoute.page),
        AutoRoute(page: MusicControlRoute.page),
        AutoRoute(page: LightControlRoute.page),
        AutoRoute(page: TvControlRoute.page),
      ];
}
