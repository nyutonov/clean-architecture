import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tana/features/chat/presentation/screens/chat/chat_screen.dart';
import 'package:tana/features/favorite/presentation/screens/favorite/favorite_screen.dart';
import 'package:tana/features/near/presentation/screens/near_screen.dart';
import 'package:tana/features/profile/presentation/screens/profile/profile_screen.dart';
import 'package:tana/features/profile/presentation/screens/qr_code/qr_code_screen.dart';
import 'package:tana/features/profile/presentation/screens/upload_photo/upload_photo_screen.dart';
import 'package:tana/features/users/presentation/screens/more_filter/more_filter_screen.dart';
import 'package:tana/features/users/presentation/screens/users/users_screen.dart';
import 'package:tana/features/verification/presentation/screens/selfie/selfie_screen.dart';
import 'package:tana/features/verification/presentation/screens/verification/verification_screen.dart';

import '../core/widgets/internet_connection_screen.dart';
import '../features/auth/presentation/screens/auth/login/login_page.dart';
import '../features/auth/presentation/screens/onboarding/location_per_screen.dart';
import '../features/auth/presentation/screens/onboarding/onboarding_screen.dart';
import '../features/home/presentation/bloc/home/home_bloc.dart';
import '../features/home/presentation/screens/event_detail/event_detail_screen.dart';
import '../features/home/presentation/screens/home/home_screen.dart';
import '../features/main/presentation/screens/main/main_mixin.dart';
import '../features/profile/presentation/screens/bio/bio_screen.dart';
import '../features/profile/presentation/screens/my_profile/my_profile_screen.dart';
import '../features/profile/presentation/screens/premium/premium_screen.dart';
import '../features/profile/presentation/screens/profile_edit/profile_edit_screen.dart';
import '../features/profile/presentation/screens/select_interests/select_interest_screen.dart';
import '../features/profile/presentation/screens/select_location/select_location_screen.dart';
import '../features/profile/presentation/screens/select_status/select_status_screen.dart';
import '../features/profile/presentation/screens/telegram/telegram_screen.dart';
import '../features/settings/presentation/screens/block_users/block_users_screen.dart';
import '../features/settings/presentation/screens/change_language/change_language_screen.dart';
import '../features/settings/presentation/screens/faq/faq_screen.dart';
import '../features/settings/presentation/screens/notifications/notifications_screen.dart';
import '../features/settings/presentation/screens/set_birth_date/set_birth_date_screen.dart';
import '../features/settings/presentation/screens/set_gender/set_gender_screen.dart';
import '../features/settings/presentation/screens/set_name/set_name_screen.dart';
import '../features/settings/presentation/screens/settings/settings_screen.dart';
import '../features/users/presentation/bloc/users/users_bloc.dart';
import '../features/users/presentation/screens/user_detail/user_detail_screen.dart';
import '../injector_container.dart';

part "name_routes.dart";

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  debugLogDiagnostics: true,
  // initialLocation: (localSource.isUserLoggedIn) ? Routes.home : Routes.signIn,
  initialLocation: Routes.home,
  routes: <RouteBase>[
    GoRoute(
      path: Routes.noInternet,
      name: Routes.noInternet,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const InternetConnectionScreen(),
    ),
    GoRoute(
      path: Routes.signIn,
      name: Routes.signIn,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const LoginPage(),
    ),
    StatefulShellRoute.indexedStack(
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, GoRouterState state, StatefulNavigationShell navigationShell) {
        return MainScreen(
          key: state.pageKey,
          navigationShell: navigationShell,
        );
      },
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          initialLocation: Routes.home,
          routes: <RouteBase>[
            GoRoute(
              path: Routes.home,
              name: Routes.home,
              builder: (_, __) => BlocProvider(
                create: (context) => sl<HomeBloc>(),
                child: HomeScreen(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          initialLocation: Routes.near,
          routes: <RouteBase>[
            GoRoute(
              path: Routes.near,
              name: Routes.near,
              builder: (_, __) => NearScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          initialLocation: Routes.favorite,
          routes: <RouteBase>[
            GoRoute(
              path: Routes.favorite,
              name: Routes.favorite,
              builder: (_, __) => FavoriteScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          initialLocation: Routes.users,
          routes: <RouteBase>[
            GoRoute(
              path: Routes.users,
              name: Routes.users,
              builder: (_, __) => BlocProvider(
                create: (context) => sl<UsersBloc>(),
                child: UsersScreen(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          initialLocation: Routes.chat,
          routes: <RouteBase>[
            GoRoute(
              path: Routes.chat,
              name: Routes.chat,
              builder: (_, __) => ChatScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
