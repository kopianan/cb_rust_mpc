import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';
import 'package:ffi/ffi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cb_rust_mpc/lib.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CBRustMpc cbRustMpc = CBRustMpc();
  @override
  void initState() {
    CBRustMpc.setup();

    super.initState();
  }

  Future<String> keyGen(String assetSecret, String assetGroup) async {
    var secret = await readJson(assetSecret);
    var group = await readJson(assetGroup);

    var secretResult = getDataAndLength(secret);
    var groupResult = getDataAndLength(group);

    Pointer<Uint8> secretPointer = secretResult[0];
    int secretLength = secretResult[1];
    Pointer<Uint8> groupPointer = groupResult[0];
    int groupLength = groupResult[1];

    var finalResult = cbRustMpc.keygen(
      secretPointer,
      secretLength,
      groupPointer,
      groupLength,
    );
    print("TEst");
    print(await finalResult);
    return finalResult;
  }

  List getDataAndLength(String jsonString) {
    List<int> list = utf8.encode(jsonString);
    final Pointer<Uint8> result = calloc.allocate<Uint8>(list.length + 1);

    Pointer<Uint8> data = result.cast();
    int dataLength = list.length;
    return [result, dataLength];
  }

  Future<String> readJson(String path) async {
    final String response = await rootBundle.loadString(path);

    return response;
  }

  Future<String>? goNow;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    keyGen('assets/secrets1.json', 'assets/group.json');
                    setState(() {});
                  },
                  child: Text("Call Secret 1"),
                ),
                ElevatedButton(
                  onPressed: () {
                    goNow = keyGen('assets/secrets2.json', 'assets/group.json');
                    setState(() {});
                  },
                  child: Text("Call Secret 2"),
                ),
                ElevatedButton(
                  onPressed: () {
                    goNow = keyGen('assets/secrets3.json', 'assets/group.json');
                    setState(() {});
                  },
                  child: Text("Call Secret 3"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
