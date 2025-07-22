import 'package:gazaburger/screen/home.dart';
import 'package:gazaburger/screen/login_scrren.dart';
import 'package:gazaburger/screen/register_screen.dart';
import 'package:gazaburger/screen/splach_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => SplashScreen()),
    GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
    GoRoute(path: '/register', builder: (context, state) => RegisterScreen()),
    GoRoute(path: '/home', builder: (context, state) => const Home()),
  ],
);
