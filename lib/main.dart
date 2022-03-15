import '../full_screen_scanner_page.dart';
import '../task_next_page.dart';
import '../testing_page.dart';
import 'package:air_design/air_design.dart';
import 'package:airoute/airoute.dart';
import 'package:flutter/material.dart';

import 'creator_page.dart';
import 'custom_size_scanner_page.dart';
import 'select_scanner_style_page.dart';

void main() => runApp(
  Airoute.createMaterialApp(
    home: App(),
    routes: <String, WidgetBuilder>{
      "/SelectScannerStylePage": (_) => SelectScannerStylePage(),
      "/CustomSizeScannerPage": (_) => CustomSizeScannerPage(),
      "/FullScreenScannerPage": (_) => FullScreenScannerPage(),
      "/TaskNextPage": (_) => TaskNextPage(),
      "/CreatorPage": (_) => CreatorPage(),
      "/TestingPage": (_) => TestingPage(),
    },
  ),
);

///
/// App
class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

///
/// _AppState
class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("1D barcode/QR code"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: AppCardOutlinedStyleWidget.defaultStyle(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        //Pular página = escanear o código QR
                        Airoute.pushNamed(
                          routeName: "/SelectScannerStylePage",
                        );
                      },
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text("Scan 1D barcode/QR code"),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: AppCardOutlinedStyleWidget.defaultStyle(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        //Página de salto = gerar código QR
                        Airoute.pushNamed(
                          routeName: "/CreatorPage",
                        );
                      },
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text("Create QR code"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}