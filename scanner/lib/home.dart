import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:scanner/components/textCopy.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final key = new GlobalKey<ScaffoldState>();
  String code = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: AppBar(
        title: Text(
          'Scan',
          style: TextStyle(color: Colors.black45),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10))),
        actions: [IconButton(icon: Icon(Icons.info), onPressed: () {})],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: TextCopy(
                text: code == '' ? "Clique em Scan para continuar" : code,
                iconButton: IconButton(
                  icon: Icon(
                    Icons.content_copy,
                    color: Color(0xFF939393),
                  ),
                  onPressed: () {
                    if (code == '') {
                      key.currentState.showSnackBar(new SnackBar(
                        content: new Text("Use o Scan primeiro"),
                      ));
                    } else {
                      Clipboard.setData(new ClipboardData(text: code));
                      key.currentState.showSnackBar(new SnackBar(
                        content:
                            new Text("Copiado para a area de transferencia"),
                      ));
                    }
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 25,
              height: 40,
              child: FlatButton(
                color: const Color(0xFF1F8CFB),
                child: Text(
                  "Scan",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => scanCode(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  scanCode() async {
    try {
      var result = await BarcodeScanner.scan();
      setState(() {
        code = result.rawContent;
      });
    } catch (e) {
      print(e);
    }
  }
}
