//
//  STAppDelegate.m
//  STJSONKitTestcase
//
//  Copyright (c) 2012 Scott Talbot. All rights reserved.
//

#import "STAppDelegate.h"

#import "JSONKit.h"


@implementation STAppDelegate {
@private
    UIWindow *_window;
}

@synthesize window = _window;
- (void)setWindow:(UIWindow *)window {
    NSAssert(_window == nil, @".window set more than once", nil);
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    window.backgroundColor = [UIColor blackColor];
    self.window = window;

    NSError *error = nil;

    char *foo = "";
    NSData *data = [NSData dataWithBytesNoCopy:(void *)foo length:strlen(foo) freeWhenDone:NO];
    id obj = [data objectFromJSONDataWithParseOptions:JKParseOptionStrict error:&error];

    if (!obj) {
        NSLog(@"JSONKit decoding failed: %@", error);
    } else {
        NSLog(@"JSONKit decoding succeeded");
    }

    return YES;
}

@end
