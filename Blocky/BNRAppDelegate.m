//
//  BNRAppDelegate.m
//  Blocky
//
//  Created by Fabrice Guillaume on 2/2/13.
//  Copyright (c) 2013 Fabrice Guillaume. All rights reserved.
//

#import "BNRAppDelegate.h"
#import "BNRExecutor.h"

@implementation BNRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    // Block is allocated and immediately passed to the BNRExecutor, which sets its equation
    // instance variable to point at it
    BNRExecutor *executor = [[BNRExecutor alloc]init];
    int multiplier = 3;
    
    [executor setEquation:^int(int x, int y) {
        int sum = x + y;
        return multiplier * sum;
        //return x + y;
    }];

    // NSLog(@"% d", [executor computeWithValue: 2 andValue: 5]);
    
    // Get a pointer to the main operation queue and add a block to it
    // Using addOperationWithBlock: on the main queue is pretty common. Many times, you will want
    // the run loop to finish drawing views and clearing the autorelease pool before a block
    // is executed.
    [[ NSOperationQueue mainQueue] addOperationWithBlock:^void(void)
    {
        NSLog(@"[BNRAppDel] computeWithValue return: %d", [executor computeWithValue:2 andValue:5]);
    }];
    
    // We will see this below message before the above
    NSLog(@"[BNRAppDel] about to exit method...");
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



@end
