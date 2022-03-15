import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:airoute/airoute.dart';

///
/// TaskNextPage
class TaskNextPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TaskNextState();
  }
}

///
/// _TaskNextState
class _TaskNextState extends State<TaskNextPage> {
  String _boxNumberInputed = "";

  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width / window.devicePixelRatio;
    double screenHeight = window.physicalSize.height / window.devicePixelRatio;

    var screenWidthSize = screenWidth;
    return Scaffold(
      appBar: AppBar(
        title: Text("Digite o número à mão"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Container(
              width: screenWidthSize / 5 * 4,
              child: TextFormField(
                initialValue: "",
                decoration: InputDecoration(
                  labelText: 'Número não escaneável',
                  hintText: "Insira um número não digitalizável",
                  errorText: "",
                  helperText: "helper",
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                textAlign: TextAlign.start,
                enabled: true,
                onChanged: (String content) {
                  _boxNumberInputed = content;
                },
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              /*
              Verifique o status do número da caixa digitalizada
              */
              showCupertinoDialog(
                context: context,
                builder: (BuildContext context) {
                  return CupertinoAlertDialog(
                    content: Text("contente : $_boxNumberInputed"),
                    actions: <Widget>[
                      CupertinoDialogAction(
                        onPressed: () {
                          Airoute.pop();
                        },
                        child: Text("Entendido"),
                      ),
                    ],
                  );
                },
              );
            },
            color: Theme.of(context).primaryColor,
            minWidth: screenWidthSize / 3,
            textColor: Colors.white,
            child: Tooltip(
              message: "",
              child: Text("confirme"),
            ),
          ),
        ],
      ),
    );
  }
}
