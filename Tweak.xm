#import <UIKit/UIKit.h>
#import <substrate.h>

static NSString * const CC15PrefsPath =
@"/var/jb/var/mobile/Library/Preferences/com.daviddios.connectivitycustomizer15.plist";

static void CC15LogCandidate(id obj) {
    if (!obj) return;
    NSString *cls = NSStringFromClass([obj class]);
    if ([cls localizedCaseInsensitiveContainsString:@"connectivity"] ||
        [cls localizedCaseInsensitiveContainsString:@"module"]) {
        NSLog(@"[ConnectivityCustomizer15] candidate: %@", cls);
    }
}

/*
 iOS 15.8.8 private Control Center selectors are intentionally not guessed.
 This discovery hook logs candidate Connectivity/Module objects. Once the
 exact class/selector ABI is confirmed on-device, this is the safe place to
 bind the final hide/show implementation.
*/
%hook NSObject
- (id)init {
    id r = %orig;
    CC15LogCandidate(r);
    return r;
}
%end

%ctor {
    NSLog(@"[ConnectivityCustomizer15] loaded: iOS %@", UIDevice.currentDevice.systemVersion);
}
