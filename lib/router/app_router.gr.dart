// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AirConditionPage]
class AirConditionRoute extends PageRouteInfo<AirConditionRouteArgs> {
  AirConditionRoute({
    Key? key,
    required String title,
    List<PageRouteInfo>? children,
  }) : super(
          AirConditionRoute.name,
          args: AirConditionRouteArgs(key: key, title: title),
          initialChildren: children,
        );

  static const String name = 'AirConditionRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AirConditionRouteArgs>();
      return AirConditionPage(key: args.key, title: args.title);
    },
  );
}

class AirConditionRouteArgs {
  const AirConditionRouteArgs({this.key, required this.title});

  final Key? key;

  final String title;

  @override
  String toString() {
    return 'AirConditionRouteArgs{key: $key, title: $title}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AirConditionRouteArgs) return false;
    return key == other.key && title == other.title;
  }

  @override
  int get hashCode => key.hashCode ^ title.hashCode;
}

/// generated route for
/// [AuthServicesPage]
class AuthServicesRoute extends PageRouteInfo<void> {
  const AuthServicesRoute({List<PageRouteInfo>? children})
      : super(AuthServicesRoute.name, initialChildren: children);

  static const String name = 'AuthServicesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AuthServicesPage();
    },
  );
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomePage();
    },
  );
}

/// generated route for
/// [LightControlPage]
class LightControlRoute extends PageRouteInfo<LightControlRouteArgs> {
  LightControlRoute({
    Key? key,
    required String title,
    List<PageRouteInfo>? children,
  }) : super(
          LightControlRoute.name,
          args: LightControlRouteArgs(key: key, title: title),
          initialChildren: children,
        );

  static const String name = 'LightControlRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LightControlRouteArgs>();
      return LightControlPage(key: args.key, title: args.title);
    },
  );
}

class LightControlRouteArgs {
  const LightControlRouteArgs({this.key, required this.title});

  final Key? key;

  final String title;

  @override
  String toString() {
    return 'LightControlRouteArgs{key: $key, title: $title}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LightControlRouteArgs) return false;
    return key == other.key && title == other.title;
  }

  @override
  int get hashCode => key.hashCode ^ title.hashCode;
}

/// generated route for
/// [MusicControlPage]
class MusicControlRoute extends PageRouteInfo<MusicControlRouteArgs> {
  MusicControlRoute({
    Key? key,
    required String title,
    List<PageRouteInfo>? children,
  }) : super(
          MusicControlRoute.name,
          args: MusicControlRouteArgs(key: key, title: title),
          initialChildren: children,
        );

  static const String name = 'MusicControlRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MusicControlRouteArgs>();
      return MusicControlPage(key: args.key, title: args.title);
    },
  );
}

class MusicControlRouteArgs {
  const MusicControlRouteArgs({this.key, required this.title});

  final Key? key;

  final String title;

  @override
  String toString() {
    return 'MusicControlRouteArgs{key: $key, title: $title}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MusicControlRouteArgs) return false;
    return key == other.key && title == other.title;
  }

  @override
  int get hashCode => key.hashCode ^ title.hashCode;
}

/// generated route for
/// [SignInPage]
class SignInRoute extends PageRouteInfo<SignInRouteArgs> {
  SignInRoute({Key? key, List<PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          args: SignInRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SignInRouteArgs>(
        orElse: () => const SignInRouteArgs(),
      );
      return SignInPage(key: args.key);
    },
  );
}

class SignInRouteArgs {
  const SignInRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SignInRouteArgs{key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SignInRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [SignUpPage]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute({List<PageRouteInfo>? children})
      : super(SignUpRoute.name, initialChildren: children);

  static const String name = 'SignUpRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SignUpPage();
    },
  );
}

/// generated route for
/// [TvControlPage]
class TvControlRoute extends PageRouteInfo<TvControlRouteArgs> {
  TvControlRoute({
    Key? key,
    required String title,
    List<PageRouteInfo>? children,
  }) : super(
          TvControlRoute.name,
          args: TvControlRouteArgs(key: key, title: title),
          initialChildren: children,
        );

  static const String name = 'TvControlRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TvControlRouteArgs>();
      return TvControlPage(key: args.key, title: args.title);
    },
  );
}

class TvControlRouteArgs {
  const TvControlRouteArgs({this.key, required this.title});

  final Key? key;

  final String title;

  @override
  String toString() {
    return 'TvControlRouteArgs{key: $key, title: $title}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TvControlRouteArgs) return false;
    return key == other.key && title == other.title;
  }

  @override
  int get hashCode => key.hashCode ^ title.hashCode;
}

/// generated route for
/// [WelcomePage]
class WelcomeRoute extends PageRouteInfo<void> {
  const WelcomeRoute({List<PageRouteInfo>? children})
      : super(WelcomeRoute.name, initialChildren: children);

  static const String name = 'WelcomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const WelcomePage();
    },
  );
}
