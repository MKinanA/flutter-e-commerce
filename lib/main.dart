import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/init_screen.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';
import 'package:shop_app/state_managements/auth.dart';
import 'package:shop_app/state_managements/cart_provider.dart';
import 'package:shop_app/state_managements/favorite_provider.dart';
import 'routes.dart';
import 'theme.dart';
import './state_managements/theme.dart';

const bool kEnableDevicePreview = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final bool initAuthIsLoggedIn = (await SharedPreferences.getInstance()).getBool('authIsLoggedIn') ?? false;
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<DarkMode>(
        create: (_) => DarkMode(),
      ),
      ChangeNotifierProvider<Auth>(
        create: (_) => Auth(),
      ),
      ChangeNotifierProvider<CartProvider>(
        create: (_) => CartProvider(),
      ),
      ChangeNotifierProvider<FavoriteProvider>(
        create: (_) => FavoriteProvider(),
      ),
    ],
    child: DevicePreview(
      enabled: kEnableDevicePreview,
      builder: (context) => MyApp(
        initAuthIsLoggedIn: initAuthIsLoggedIn,
      ),
    )
  ));
}

class MyApp extends StatelessWidget {
  final bool initAuthIsLoggedIn;

  const MyApp({this.initAuthIsLoggedIn = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DarkMode>(
      builder: (context, darkMode, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true, // ignore: deprecated_member_use
        builder: DevicePreview.appBuilder,
        locale: DevicePreview.locale(context),
        title: name,
        theme: AppTheme.theme(context, darkMode.isEnabled),
        initialRoute: initAuthIsLoggedIn ? InitScreen.routeName : SplashScreen.routeName,
        routes: routes,
      ),
    );
  }
}
