import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ai_barcode/ai_barcode.dart';
import 'package:airoute/airoute.dart';
import 'package:ai_awesome_message/ai_awesome_message.dart';
import 'package:flutter_ai_scan_teste/custom_dialog.dart';
import 'package:flutter_beep/flutter_beep.dart';

class TestingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TestingState();
  }
}

class _TestingState extends State<TestingPage> {
  ScannerController? _scannerController;

  @override
  void initState() {
    super.initState();
    _scannerController = ScannerController(scannerResult: (result) async {
      //desligue o reconhecimento
      _scannerController?.stopCameraPreview();
      //informações imediatas
      /*Airoute.push<Object>(
        route: AwesomeMessageRoute(
          awesomeMessage: AwesomeHelper.createAwesome(
              title: "Detect result", message: "$result"),
          theme: null,
          settings: RouteSettings(name: "/messageRouteName"),
        ),
      );*/
      showDialog(context: context, builder: (context) => const CustomDialog(title: 'Aviso', content: 'Batendo ponto... Aguarde!'),);
      Future.delayed(Duration(seconds: 3),(){
        FlutterBeep.beep();
        Navigator.pop(context);
        showDialog(context: context, builder: (context) => CustomDialog(title: 'Aviso', content: 'Ponto batido com Sucesso!'),);
        Timer(Duration(seconds: 1), (){
          Navigator.pop(context);
          //identificação aberta
          _scannerController?.startCameraPreview();
        });
      });





    });
  }

  @override
  void dispose() {
    super.dispose();
    _scannerController = null;
  }

  _startPreview() async {
    String result = await _scannerController?.startCameraPreview();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TestingWebFeature"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            MaterialButton(
              onPressed: () {
                FlutterBeep.beep(false);
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("beep"),
            ),
            MaterialButton(
              onPressed: () {
                _scannerController?.startCamera();
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("Start camera"),
            ),
            MaterialButton(
              onPressed: () {
                _scannerController?.startCameraFront();
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("Start Front camera"),
            ),
            MaterialButton(
              onPressed: () {
                _startPreview();
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("Start camera preview"),
            ),
            MaterialButton(
              onPressed: () {
                //parar a visualização da câmera
                _scannerController?.stopCameraPreview();
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("Stop camera preview"),
            ),
            MaterialButton(
              onPressed: () {
                //liberar câmera
                _scannerController?.stopCamera();
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("Stop/Release camera"),
            ),
            MaterialButton(
              onPressed: () {
                //flash
                _scannerController?.toggleFlash();
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("Flash camera"),
            ),
            Container(
              width: 750,
              height: 750,
              child: PlatformAiBarcodeScannerWidget(
                platformScannerController: _scannerController!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
