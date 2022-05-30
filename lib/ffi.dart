/// bindings for `libgg18_mpc_ecdsa_ffi`

import 'dart:ffi';
import 'package:ffi/ffi.dart' as ffi;
import 'dart:io';

// ignore_for_file: unused_import, camel_case_types, non_constant_identifier_names
final DynamicLibrary _dl = _open();
DynamicLibrary _open() {
  if (Platform.isAndroid) return DynamicLibrary.open('libgg18_mpc_ecdsa_ffi.so');
  if (Platform.isIOS) return DynamicLibrary.executable();
  throw UnsupportedError('This platform is not supported.');
}

/// C function `store_dart_post_cobject`.
void store_dart_post_cobject(
  Pointer<NativeFunction<Int8 Function(Int64, Pointer<Dart_CObject>)>> ptr,
) {
  _store_dart_post_cobject(ptr);
}
final _store_dart_post_cobject_Dart _store_dart_post_cobject = _dl.lookupFunction<_store_dart_post_cobject_C, _store_dart_post_cobject_Dart>('store_dart_post_cobject');
typedef _store_dart_post_cobject_C = Void Function(
  Pointer<NativeFunction<Int8 Function(Int64, Pointer<Dart_CObject>)>> ptr,
);
typedef _store_dart_post_cobject_Dart = void Function(
  Pointer<NativeFunction<Int8 Function(Int64, Pointer<Dart_CObject>)>> ptr,
);

/// C function `wire_keygen`.
void wire_keygen(
  int port_,
  Pointer<Uint8> secrets_byte_vec,
  int secrets_byte_len,
  Pointer<Uint8> group_byte_vec,
  int group_byte_len,
) {
  _wire_keygen(port_, secrets_byte_vec, secrets_byte_len, group_byte_vec, group_byte_len);
}
final _wire_keygen_Dart _wire_keygen = _dl.lookupFunction<_wire_keygen_C, _wire_keygen_Dart>('wire_keygen');
typedef _wire_keygen_C = Void Function(
  Int64 port_,
  Pointer<Uint8> secrets_byte_vec,
  Uint64 secrets_byte_len,
  Pointer<Uint8> group_byte_vec,
  Uint64 group_byte_len,
);
typedef _wire_keygen_Dart = void Function(
  int port_,
  Pointer<Uint8> secrets_byte_vec,
  int secrets_byte_len,
  Pointer<Uint8> group_byte_vec,
  int group_byte_len,
);
