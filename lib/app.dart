import 'package:flutter/material.dart';
import 'package:krista_scanner/pages/login_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Krista Unique',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                minimumSize: Size.fromHeight(60)),
          ),
          appBarTheme: AppBarTheme(
            textTheme: Theme.of(context).primaryTextTheme.copyWith(
                  headline6: Theme.of(context).textTheme.headline6.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                ),
          ),
        ),
        home: LoginPage(),
      );
}
