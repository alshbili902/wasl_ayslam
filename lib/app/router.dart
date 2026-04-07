import 'package:go_router/go_router.dart';
import '../features/splash/splash_screen.dart';
import '../features/onboarding/onboarding_screen.dart';
import '../features/home/home_screen.dart';
import '../features/categories/categories_screen.dart';
import '../features/athkar/athkar_screen.dart';
import '../features/favorites/favorites_screen.dart';
import '../features/search/search_screen.dart';
import '../features/tasbeeh/tasbeeh_screen.dart';
import '../features/reminders/reminders_screen.dart';
import '../features/settings/settings_screen.dart';
import '../features/about/about_screen.dart';
import '../features/qibla/qibla_screen.dart';
import '../features/prayer_times/prayer_times_screen.dart';

final goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/categories',
      builder: (context, state) => const CategoriesScreen(),
    ),
    GoRoute(
      path: '/athkar/:categoryId/:categoryName',
      builder: (context, state) {
        final categoryId = state.pathParameters['categoryId']!;
        final categoryName = state.pathParameters['categoryName']!;
        return AthkarScreen(categoryId: categoryId, categoryName: categoryName);
      },
    ),
    GoRoute(
      path: '/favorites',
      builder: (context, state) => const FavoritesScreen(),
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) => const SearchScreen(),
    ),
    GoRoute(
      path: '/tasbeeh',
      builder: (context, state) => const TasbeehScreen(),
    ),
    GoRoute(
      path: '/reminders',
      builder: (context, state) => const RemindersScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: '/about',
      builder: (context, state) => const AboutScreen(),
    ),
    GoRoute(
      path: '/qibla',
      builder: (context, state) => const QiblaScreen(),
    ),
    GoRoute(
      path: '/prayer_times',
      builder: (context, state) => const PrayerTimesScreen(),
    ),
  ],
);
