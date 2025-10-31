import 'package:drinks/const/languages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/drink_list.dart';
import 'screens/settings.dart';

import 'services/register_singleton.dart';

import 'l10n/app_localizations.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = languages['EN']!;

  int _selectedIndex = 0;
  late final List<Widget> _pages = [
    DrinkList(),
    SettingsPage(onLocaleChange: onLangChange)
  ];

  @override
  void initState() {
    super.initState();
    loadLang();
  }

  void loadLang() async {
    final prefs = await SharedPreferences.getInstance();
    onLangChange(languages[prefs.getString('language') ?? 'EN']!);
  }

  void onLangChange(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: _locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('pl'),
      ],
      home: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: onItemTapped,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.local_drink),
                label: 'drinks'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'settings'
              ),
          ],
        ),
      ),
    );
  }
}
