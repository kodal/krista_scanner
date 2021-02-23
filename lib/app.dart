import 'package:flutter/material.dart';

import 'pages/scanner_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Krista Unique',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ScannerPage(title: 'Приходивание'),
      );
}
