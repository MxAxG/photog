//
//  AppDelegate.swift
//  Photog
//
//  Created by Michael Gordon on 24/07/2015.
//  Copyright (c) 2015 Personal. All rights reserved.
//
import Parse
import Bolts
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        self.setupParse()
        self.setupAppAppearance()
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        var navigationController = UINavigationController()
        var startViewController = StartViewController(nibName: "StartViewController", bundle: nil)
        
        // If there's a logged in user, then present the main UI
        
        if PFUser.currentUser() == nil
        {
            navigationController.viewControllers = [startViewController]
        }
        else
        {
            var tabBarController = TabBarController()
            navigationController.viewControllers = [startViewController, tabBarController]
        }
        
        var viewController = UIViewController()
        viewController.view.backgroundColor = UIColor.magentaColor()
        
        self.window!.rootViewController = navigationController
        self.window!.makeKeyAndVisible()
        
        // Override point for customization after application launch.
        
        // If there's a logged in user, present the main UI
        
        // Else present the UI for logging in or creating an account
        return true
    }
    
    func setupParse() {
        // [Optional] Power your app with Local Datastore. For more info, go to
        // https://parse.com/docs/ios_guide#localdatastore/iOS
        // Parse.enableLocalDatastore()
        
        // Initialize Parse.
        Parse.setApplicationId("lHyB6qNqAHh7vTiV3VTCCv07jmFXLCDm6U71ZqNE",
            clientKey: "xzh3hZZPJtaZlzbWKOR3OW4NNC2zEJQsIKrY5alG")
        
        // [Optional] Track statistics around application opens.
        // PFAnalytics.trackAppOpenedWithLaunchOptions(launchOptions)
        
//        let testObject = PFObject(className: "TestObject")
//        testObject["foo"] = "bar"
//        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
//            println("Object has been saved.")
//        }
    }
    
    func setupAppAppearance()
    {
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        UINavigationBar.appearance().barTintColor = UIColor.blackColor()
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        
        UITabBar.appearance().barTintColor = UIColor.blackColor()
        UITabBar.appearance().tintColor = UIColor.whiteColor()
        UITabBar.appearance().selectionIndicatorImage = UIImage(named: "SelectedTabBackground")
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

