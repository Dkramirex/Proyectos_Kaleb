import 'package:flutter/material.dart';
import 'package:preferences_app/providers/ModifyClient_screen2.dart';
import 'package:preferences_app/providers/register_contacts.dart';
import 'package:preferences_app/providers/register_contacts2.dart';
import 'package:preferences_app/providers/theme_provider.dart';
import 'package:preferences_app/screens/screens.dart';
import 'package:preferences_app/share_preferences/preferences.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Preferences.init();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (_) => ThemeProvider(isDarkmode: Preferences.isDarkmode))
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: HomeScreen.routerName,
      routes: {
        HomeScreen.routerName: (_) => const HomeScreen(),
        SettingsScreen.routerName: (_) => const SettingsScreen(),
        Modifycontact2.routerName: (_) => const Modifycontact2(),
        ContactScreen2.routerName: (_) => const ContactScreen2(),
        RegisterContacts2.routerName: (_) => const RegisterContacts2(),
      },
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}
