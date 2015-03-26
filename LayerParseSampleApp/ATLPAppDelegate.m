//
//  AppDelegate.m
//  LayerParseSampleApp
//
//  Created by Kabir Mahal on 3/25/15.
//  Copyright (c) 2015 Layer. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "ATLPAppDelegate.h"
#import <Parse/Parse.h>
#import <PFFacebookUtils.h>
#import "ATLPViewController.h"
#import <LayerKit/LayerKit.h>

@interface ATLPAppDelegate ()

@end

@implementation ATLPAppDelegate

static NSString *const ATLPLayerAppIDString = @"44a270b6-7c58-11e4-bbba-fcf307000352";
static NSString *const ParseAppIDString = @"hQvFXx927IAtRepgc8qL9riePQozaYgGXzSpxyNd";
static NSString *const ParseClientKeyString = @"hHnDw8qFmZuDtvasWrbo3id2RUya4q5nHbgnF2fA";

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //enable Parse local data store for user persistence
    [Parse enableLocalDatastore];
    // Set up Parse
    [Parse setApplicationId:ParseAppIDString
                  clientKey:ParseClientKeyString];
    
    // Set default ACLs
    PFACL *defaultACL = [PFACL ACL];
    [defaultACL setPublicReadAccess:YES];
    [PFACL setDefaultACL:defaultACL withAccessForCurrentUser:YES];
    
    // Initializes a LYRClient object
    NSUUID *appID = [[NSUUID alloc] initWithUUIDString:ATLPLayerAppIDString];
    LYRClient *layerClient = [LYRClient clientWithAppID:appID];
    
    // Show View Controller
    ATLPViewController *controller = [[ATLPViewController alloc] init];
    controller.layerClient = layerClient;
    
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:controller];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end