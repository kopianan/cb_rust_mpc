import 'dart:async';
import 'dart:ffi';
import 'dart:isolate';
import 'package:isolate/isolate.dart';
import 'package:isolate/ports.dart';

import 'ffi.dart' as native;

class CBRustMpc {
  static setup() {
    native.store_dart_post_cobject(NativeApi.postCObject);
  }

  Future<String> keygen(
    Pointer<Uint8> secret,
    int secretUnitLength,
    Pointer<Uint8> group,
    int groupUnitLength,
  ) async {
    final completer = Completer<String>();
    final nativePort = singleCompletePort(completer);

    final res = native.wire_keygen(
      nativePort.nativePort,
      secret,
      secretUnitLength,
      group,
      groupUnitLength,
    );
    print("Keygen");
    

    return completer.future;
  }

  // Future<String> conncectToSignal() async {
  //   final completer = Completer<String>();
  //   final nativePort = singleCompletePort(completer);

  //   final res = native.getSignalServerCert(nativePort.nativePort);
  //   print("conncectToSignal");

  //   return completer.future;
  // }
}
