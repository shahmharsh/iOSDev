//
//  AppDelegate.m
//  Assignment3
//
//  Created by Harsh Shah on 10/6/14.
//  Copyright (c) 2014 Harsh Shah. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    ViewController *mainController = (ViewController *) self.window.rootViewController;
    
    NSUserDefaults *savedValues = [NSUserDefaults standardUserDefaults];
    mainController->savedInputText = [savedValues stringForKey:@"userInput"];
    mainController->savedXCord = [savedValues stringForKey:@"xCordinate"];
    mainController->savedYCord = [savedValues stringForKey:@"yCordinate"];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {

}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    ViewController *mainController = (ViewController *) self.window.rootViewController;
    NSString *userInput = mainController.inputText.text;
    NSString *xCord = mainController.xCordinate.text;
    NSString *yCord = mainController.yCordinate.text;
    
    NSUserDefaults *userValues = [NSUserDefaults standardUserDefaults];
    [userValues setObject:userInput forKey:@"userInput"];
    [userValues setObject:xCord forKey:@"xCordinate"];
    [userValues setObject:yCord forKey:@"yCordinate"];
    [userValues synchronize];
}

@end


