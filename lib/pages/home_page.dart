import 'package:flutter/material.dart';
import 'package:krista_scanner/pages/scanner_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Center(child: Image.asset('assets/Logo.png')),
                ),
                Expanded(
                  child: Text(
                    'Атабекян Марина',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      ElevatedButton(
                        child: Text(ScannerType.coming.name),
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) =>
                                ScannerPage(type: ScannerType.coming),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        child: Text(ScannerType.selling.name),
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) =>
                                ScannerPage(type: ScannerType.selling),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        child: Text(ScannerType.revision.name),
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) =>
                                ScannerPage(type: ScannerType.revision),
                          ),
                        ),
                      ),
                      SizedBox(height: 56),
                      ElevatedButton(
                        child: Text('Выход'),
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                        onPressed: () => null,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
