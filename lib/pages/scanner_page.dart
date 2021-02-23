import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScannerPage extends StatefulWidget {
  ScannerPage({Key key, this.title}) : super(key: key);
  final String title;
  final List<String> list = ['036000291452', '1234567890128'];

  @override
  _ScannerPageState createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  final _qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController _controller;
  String lastCode;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      _controller.pauseCamera();
    } else if (Platform.isIOS) {
      _controller.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: false,
          backgroundColor: Colors.black.withOpacity(0.2),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 8,
              ),
              child: ElevatedButton(
                onPressed: () => null,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                        child: Text(
                      'Открыть список',
                      overflow: TextOverflow.ellipsis,
                    )),
                    SizedBox(width: 4),
                    Text('10/20'),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            Builder(
              builder: (context) => QRView(
                key: _qrKey,
                overlay: QrScannerOverlayShape(
                  borderRadius: 25,
                  borderWidth: 2,
                  borderColor: Colors.blue,
                ),
                onQRViewCreated: (controller) {
                  this._controller = controller;
                  print('created');
                  _controller.scannedDataStream.listen((event) {
                    if (lastCode == event.code) return;
                    lastCode = event.code;
                    print('code : $lastCode');
                    SystemSound.play(SystemSoundType.click);
                    Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text(lastCode)),
                    );
                  });
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _controller?.resumeCamera();
            _controller?.toggleFlash();
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      );

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}