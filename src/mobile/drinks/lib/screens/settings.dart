import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../l10n/app_localizations.dart';

import '../const/languages.dart';

class SettingsPage extends StatefulWidget {
  final Function(Locale) onLocaleChange;

  SettingsPage({required this.onLocaleChange});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _selectedLanguage = 'EN';

  @override
  void initState() {
    super.initState();
    loadLanguage();
  }

  void setLang(String lang) {
    setState(() {
      _selectedLanguage = lang;
    });
    widget.onLocaleChange(languages[lang]!);
  }

  Future<void> loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final lang = prefs.getString('language') ?? 'EN';
    setLang(lang);
  }

  Future<void> saveLanguage(String lang) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', lang);
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(t.translate('settingsTitle'))),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              t.translate('settingsSelectLanguage'),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButton<String>(
              value: _selectedLanguage,
              items: languages.keys.map((lang) {
                return DropdownMenuItem(
                  value: lang,
                  child: Text(lang),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setLang(value);
                  saveLanguage(value);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
