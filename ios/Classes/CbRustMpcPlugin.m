#import "CbRustMpcPlugin.h"
#if __has_include(<cb_rust_mpc/cb_rust_mpc-Swift.h>)
#import <cb_rust_mpc/cb_rust_mpc-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "cb_rust_mpc-Swift.h"
#endif

@implementation CbRustMpcPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCbRustMpcPlugin registerWithRegistrar:registrar];
}
@end
